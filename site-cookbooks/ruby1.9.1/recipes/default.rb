#
# Cookbook Name:: ruby1.9.1
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

package 'ruby1.9.1-full' do
  action :upgrade
end

script 'update-alternatices' do
  not_if "update-alternatives --get-selections|grep ruby1.9.1"
  interpreter 'bash'
  user 'root'
  action :run
  code <<EOS
echo ruby manual /usr/bin/ruby1.9.1 | update-alternatives --set-selections
echo gem  manual /usr/bin/gem1.9.1  | update-alternatives --set-selections
EOS
end
