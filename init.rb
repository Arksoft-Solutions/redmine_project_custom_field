require 'redmine'

Redmine::Plugin.register :redmine_project_custom_field do
  name 'Project Custom Field Format'
  author 'Arksoft Solutions - Jorge Rodriguez'
  description 'Adds a custom field format to select one or multiple projects with hierarchical numbering.'
  version '1.0.0'
  url 'https://github.com/Arksoft-Solutions/redmine_project_custom_field'
  author_url 'https://github.com/Arksoft-Solutions/'
  requires_redmine version_or_higher: '5.1.0'
end
