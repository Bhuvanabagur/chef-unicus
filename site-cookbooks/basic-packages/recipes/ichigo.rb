#
# Cookbook Name:: basic-packages
# Recipe:: ichigo
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

['streamer', 'ffmpeg'].each do |p|
  package p do
    action :upgrade
  end
end
