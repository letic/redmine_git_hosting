module GitHosting
  module Patches
    module GroupsControllerPatch
      unloadable

      def self.included(base)
        base.class_eval do

        end
        base.send(:before_filter, :disable_git_observer_updates, :only=>[:update, :destroy, :add_users, :remove_user, :edit_membership, :destroy_membership])
        base.send(:after_filter, :do_single_update,  :only=>[:update, :destroy, :add_users, :remove_user, :edit_membership, :destroy_membership])
      end

      @@original_projects = []

      def disable_git_observer_updates
        GitHostingObserver.set_update_active(false)
      end

      def do_single_update
        GitHostingObserver.set_update_active(true)
      end

    end
  end
end

unless GroupsController.included_modules.include?(GitHosting::Patches::GroupsControllerPatch)
  GroupsController.send(:include, GitHosting::Patches::GroupsControllerPatch)
end
