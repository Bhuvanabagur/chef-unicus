#
# Cookbook Name:: basic-packages
# Recipe:: starfish
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

pkgs = %w!
mosh
transmission-cli
rinse
cron-apt
bluez-utils
gnome-bluetooth
!

[*pkgs].each do |p|
  package p do
    action :upgrade
  end
end
