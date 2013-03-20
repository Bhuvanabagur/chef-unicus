#
# Cookbook Name:: bind
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

zone_file     = '/etc/bind/db.unicus.ddo.jp'
rev_zone_file = '/etc/bind/db.192.168.0'
conf_options  = '/etc/bind/named.conf.options'

%w|bind9 bind9utils|.each do |p|
  package p do
    action :upgrade
  end
end

[conf_options, zone_file, rev_zone_file].each do |file|
  template file do
    owner 'root'
    group 'root'
    mode 0644

    notifies :run, 'script[named config check]', :immediately
  end
end

script 'named config check' do
  interpreter 'bash'
  action :nothing
  user 'root'
  code <<EOS
named-checkconf /etc/bind/named.conf                    || exit 1
named-checkzone unicus.ddo.jp          #{zone_file}     || exit 1
named-checkzone 0.168.192.in-addr.arpa #{rev_zone_file} || exit 1
EOS
end

service 'bind9' do
  action :enable
  supports :start => true, :stop => true, :reload => true, :restart => true, :status => true

  subscribes :restart, "template[#{conf_options}]"
  subscribes :restart, "template[#{zone_file}]"
  subscribes :restart, "template[#{rev_zone_file}]"
end
