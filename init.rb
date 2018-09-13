require 'redmine'
require_dependency 'redmine_omniauth_gitlab/hooks'

Redmine::Plugin.register :redmine_omniauth_gitlab do
  name 'Redmine Omniauth Gitlab Plugin'
  author 'zhangqiuyun@infohold.com.cn'
  description 'This is a plugin for Redmine registration through gitlab'
  version '0.0.1'
  url 'https://github.com/qbcbyb/redmine_omniauth_gitlab'
  author_url 'https://github.com/qbcbyb'

  settings :default => {
    :site => "",
    :client_id => "",
    :client_secret => "",
    :oauth_autentification => false,
    :allowed_domains => ""
  }, :partial => 'settings/gitlab_settings'
end
