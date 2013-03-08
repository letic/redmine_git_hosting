# Set up autoload of patches
require 'dispatcher' unless Rails::VERSION::MAJOR >= 3

def git_hosting_patch(&block)
  if Rails::VERSION::MAJOR >= 3
    ActionDispatch::Callbacks.to_prepare(&block)
  else
    Dispatcher.to_prepare(:redmine_git_patches,&block)
  end
end

git_hosting_patch do
  ## Redmine dependencies
  # require project first!
  require_dependency 'project'
  require_dependency 'projects_controller'
  require_dependency 'principal'
  require_dependency 'repository'
  require_dependency 'repository/git'
  require_dependency 'redmine/scm/adapters/git_adapter'
  require_dependency 'repositories_controller'
  require_dependency 'user'
  require_dependency 'users_controller'
  require_dependency 'my_controller'
  require_dependency 'groups_controller'
  require_dependency 'roles_controller'
  require_dependency 'members_controller'
  require_dependency 'sys_controller'

  ## Redmine Git Hosting Libs
  require_dependency 'libs/git_hosting'
  require_dependency 'libs/git_hosting_conf'
  require_dependency 'libs/gitolite_conf'
  require_dependency 'libs/gitolite_recycle'
  require_dependency 'libs/git_adapter_hooks'
  require_dependency 'libs/cached_shell_redirector'
  require_dependency 'redmine/scm/adapters/git_adapter'

  ## Redmine Git Hosting Patches
  require_dependency 'git_hosting/patches/project_patch'
  require_dependency 'git_hosting/patches/projects_controller_patch'

  require_dependency 'git_hosting/patches/repository_patch'
  require_dependency 'git_hosting/patches/repositories_controller_patch'
  require_dependency 'git_hosting/patches/repository_cia_filters'

  require_dependency 'git_hosting/patches/user_patch'
  require_dependency 'git_hosting/patches/users_controller_patch'

  require_dependency 'git_hosting/patches/groups_controller_patch'
  require_dependency 'git_hosting/patches/members_controller_patch'
  require_dependency 'git_hosting/patches/my_controller_patch'
  require_dependency 'git_hosting/patches/roles_controller_patch'

  require_dependency 'git_hosting/patches/settings_controller_patch'
  require_dependency 'git_hosting/patches/sys_controller_patch'

  # Put git_adapter_patch last (make sure that git_cmd stays patched!)
  require_dependency 'git_hosting/patches/git_repository_patch'
  require_dependency 'git_hosting/patches/git_adapter_patch'
end
