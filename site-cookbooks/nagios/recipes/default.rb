#
# Cookbook Name:: nagios
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#
%w|nagios3 nagios-plugins|.each do |p|
  package p do
    action :upgrade
  end
end

config_path = "/etc/nagios3/conf.d/"

# delete default config files
["contacts_nagios2.cfg", "extinfo_nagios2.cfg", "generic-host_nagios2.cfg",
 "generic-service_nagios2.cfg", "hostgroups_nagios2.cfg", "localhost_nagios2.cfg",
 "services_nagios2.cfg", "timeperiods_nagios2.cfg"].each do |name|
  config_file = config_path + name
  file config_file do
    action :delete
    notifies :restart, 'service[nagios3]'
  end
end

# install config files
["contacts.cfg", "extinfo.cfg", "generic-host.cfg",
 "generic-service.cfg", "hostgroups.cfg", "localhost.cfg",
 "otherhosts.cfg", "services.cfg", "timeperiods.cfg",
 "commands.cfg"].each do |name|
  config_file = config_path + name
  template config_file do
    owner 'root'
    group 'root'
    mode 0644
    notifies :restart, 'service[nagios3]'
  end
end

# check_x224
remote_file '/usr/lib/nagios/plugins/check_x224' do
  source 'http://troels.arvin.dk/code/nagios/check_x224'
  owner 'root'
  group 'root'
  mode 0755
end

service 'nagios3' do
  action [:enable, :start]
  supports :start => true, :stop => true, :restart => true, :reload => true, :status => true
end
