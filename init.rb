require 'redmine'
require_dependency 'redmine_omniauth_gitlab/hooks'

Redmine::Plugin.register :redmine_omniauth_gitlab do
  name 'Redmine Omniauth Gitlab Plugin'
  author 'zhangqiuyun@infohold.com.cn'
  description 'This is a plugin for Redmine registration through gitlab'
  version '0.0.2'
  url 'https://github.com/qbcbyb/redmine_omniauth_gitlab'
  author_url 'https://github.com/qbcbyb'

  settings :default => {
    :site => "",
    :client_id => "",
    :client_secret => "",
    :oauth_authentification => false,
    :allowed_domains => "",
    :register_enable => false
  }, :partial => 'settings/gitlab_settings'

  Redmine::MenuManager.items(:account_menu).root.children.each do |node|
    if node.name == :register 
      node.@condition = Proc.new { !User.current.logged? && Setting.self_registration? && !Setting.plugin_redmine_omniauth_gitlab['register_enable'] }
    end
  end
end
