module GitHosting
  module Patches
    module SysControllerPatch
      unloadable

      def self.included(base)
        base.class_eval do

        end
        base.send(:alias_method_chain, :fetch_changesets, :disable_update)
      end

      def fetch_changesets_with_disable_update
        # Turn of updates during repository update
        GitHostingObserver.set_update_active(false);

        # Do actual update
        fetch_changesets_without_disable_update

        # Perform the updating process on all projects
        GitHostingObserver.set_update_active(:resync_all);
      end

    end
  end
end

unless SysController.included_modules.include?(GitHosting::Patches::SysControllerPatch)
  SysController.send(:include, GitHosting::Patches::SysControllerPatch)
end
