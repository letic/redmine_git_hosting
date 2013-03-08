module GitHosting
  module Patches
    module UserPatch
      unloadable

      def self.included(base)
        base.class_eval do
          # initialize association from user -> gitolite_public_keys
          has_many :gitolite_public_keys, :dependent => :destroy
        end
      end

    end
  end
end

unless User.included_modules.include?(GitHosting::Patches::UserPatch)
  User.send(:include, GitHosting::Patches::UserPatch)
end
