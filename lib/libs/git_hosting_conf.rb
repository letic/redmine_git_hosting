module GitHostingConf

  LOCK_WAIT_IF_UNDEF            = 10
  REPOSITORY_IF_UNDEF           = 'repositories/'
  REDMINE_SUBDIR                = ''
  REDMINE_HIERARCHICAL          = true
  HTTP_SERVER                   = 'localhost'
  HTTP_SERVER_SUBDIR            = ''
  TEMP_DATA_DIR                 = '/tmp/redmine_git_hosting'
  SCRIPT_DIR                    = ''
  SCRIPT_PARENT                 = 'bin'
  GIT_USER                      = 'git'
  GIT_SERVER                    = 'localhost'
  GITOLITE_SSH_PRIVATE_KEY      = (ENV['HOME'] + '/.ssh/redmine_gitolite_admin_id_rsa').to_s
  GITOLITE_SSH_PUBLIC_KEY       = (ENV['HOME'] + '/.ssh/redmine_gitolite_admin_id_rsa.pub').to_s
  ALL_PROJECTS_USE_GIT          = false
  REPO_IDENT_UNIQUE             = true
  GITOLITE_CONFIG_FILE          = 'gitolite.conf'
  GITOLITE_CONFIG_HAS_ADMIN_KEY = true


  # Time in seconds to wait before giving up on acquiring the lock
  def self.lock_wait_time
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['gitLockWaitTime'].nil?
      Setting.plugin_redmine_git_hosting['gitLockWaitTime'].to_i
    else
      LOCK_WAIT_IF_UNDEF
    end
  end

  # Repository base path (relative to git user home directory)
  def self.repository_base
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['gitRepositoryBasePath'].nil?
      Setting.plugin_redmine_git_hosting['gitRepositoryBasePath']
    else
      REPOSITORY_IF_UNDEF
    end
  end

  # Redmine subdirectory path (relative to Repository base path
  def self.repository_redmine_subdir
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['gitRedmineSubdir'].nil?
      Setting.plugin_redmine_git_hosting['gitRedmineSubdir']
    else
      REDMINE_SUBDIR
    end
  end

  # Redmine repositories in hierarchy
  def self.repository_hierarchy
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['gitRepositoryHierarchy'].nil?
      if Setting.plugin_redmine_git_hosting['gitRepositoryHierarchy'] == 'true'
        return true
      else
        return false
      end
    else
      REDMINE_HIERARCHICAL
    end
  end

  def self.http_server
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['httpServer'].nil?
      Setting.plugin_redmine_git_hosting['httpServer']
    else
      HTTP_SERVER
    end
  end

  def self.http_server_subdir
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['httpServerSubdir'].nil?
      Setting.plugin_redmine_git_hosting['httpServerSubdir']
    else
      HTTP_SERVER_SUBDIR
    end
  end

  def self.temp_data_dir
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['gitTempDataDir'].nil?
      Setting.plugin_redmine_git_hosting['gitTempDataDir']
    else
      TEMP_DATA_DIR
    end
  end

  def self.script_dir
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['gitScriptDir'].nil?
      Setting.plugin_redmine_git_hosting['gitScriptDir']
    else
      SCRIPT_DIR
    end
  end

  def self.script_parent
    SCRIPT_PARENT
  end

  # Gitolite SSH Private Key
  def self.gitolite_ssh_private_key
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['gitoliteIdentityFile'].nil?
      Setting.plugin_redmine_git_hosting['gitoliteIdentityFile']
    else
      GITOLITE_SSH_PRIVATE_KEY
    end
  end

  # Gitolite SSH Public Key
  def self.gitolite_ssh_public_key
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['gitoliteIdentityPublicKeyFile'].nil?
      Setting.plugin_redmine_git_hosting['gitoliteIdentityPublicKeyFile']
    else
      GITOLITE_SSH_PUBLIC_KEY
    end
  end

  # Git user
  def self.git_user
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['gitUser'].nil?
      Setting.plugin_redmine_git_hosting['gitUser']
    else
      GIT_USER
    end
  end

  # Git server
  def self.git_server
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['gitServer'].nil?
      Setting.plugin_redmine_git_hosting['gitServer']
    else
      GIT_SERVER
    end
  end

  # All projects use Git?
  def self.all_projects_use_git?
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['allProjectsUseGit'].nil?
      if Setting.plugin_redmine_git_hosting['allProjectsUseGit'] == 'true'
        return true
      else
        return false
      end
    else
      ALL_PROJECTS_USE_GIT
    end
  end

  # Unique identifier for repo?
  def self.repo_ident_unique?
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['gitRepositoryIdentUnique'].nil?
      if Setting.plugin_redmine_git_hosting['gitRepositoryIdentUnique'] == 'true'
        return true
      else
        return false
      end
    else
      REPO_IDENT_UNIQUE
    end
  end

  # Gitolite config file
  def self.gitolite_config_file
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['gitConfigFile'].nil?
      Setting.plugin_redmine_git_hosting['gitConfigFile']
    else
      GITOLITE_CONFIG_FILE
    end
  end

  # Gitolite config has admin key
  def self.gitolite_config_has_admin_key?
    if !Setting.plugin_redmine_git_hosting.nil? and !Setting.plugin_redmine_git_hosting['gitConfigHasAdminKey'].nil?
      if Setting.plugin_redmine_git_hosting['gitConfigHasAdminKey'] == 'true'
        return true
      else
        return false
      end
    else
      GITOLITE_CONFIG_HAS_ADMIN_KEY
    end
  end

end

