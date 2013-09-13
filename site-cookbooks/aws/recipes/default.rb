#
# Cookbook Name:: aws
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "python"

python_pip "awscli" do
  action :install
end
