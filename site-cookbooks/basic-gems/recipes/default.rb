#
# Cookbook Name:: basic-gems
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

['tw',
 'bundler'
].each do |gem|
  gem_package gem do

  end
end
