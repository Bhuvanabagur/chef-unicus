#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2013, Yuto HAYAMIZU
#
# All rights reserved - Do Not Redistribute
#

redis_tarball_uri = 'http://redis.googlecode.com/files/redis-2.6.11.tar.gz'
redis_tarball = "#{Chef::Config[:file_cache_path]}/#{File.basename(redis_tarball_uri)}"

remote_file redis_tarball do
  source redis_tarball_uri
end

script 'redis-install' do
  not_if do
    unless system('which redis-server')
      false
    else
      File.basename(redis_tarball_uri) =~ /redis-(\d+\.\d+\.\d+)\.tar\.gz$/
      uri_version = $~[1]
      `redis-server --version` =~ / v=(\d+\.\d+\.\d+) /
      installed_version = $~[1]
      uri_version == installed_version
    end
  end
  interpreter 'bash'
  action :run
  user 'root'
  cwd File.dirname(redis_tarball)
  code <<EOS
rm -rf #{File.dirname(redis_tarball)}/#{File.basename(redis_tarball, '.tar.gz')}
tar xf #{redis_tarball}
cd #{File.dirname(redis_tarball)}/#{File.basename(redis_tarball, '.tar.gz')}
./configure --prefix=/usr/local
make install
EOS
end

directory '/etc/redis' do
  owner 'root'
  group 'root'
  mode 0755
end

directory '/var/lib/redis' do
  owner 'root'
  group 'root'
  mode 0755
end

template '/etc/redis/redis.conf' do
  owner 'root'
  group 'root'
  mode 0755

  notifies :restart, 'service[redis-server]'
end

template '/etc/init.d/redis-server' do
  owner 'root'
  group 'root'
  mode 0755

  notifies :enable, 'service[redis-server]'
end

service 'redis-server' do
  action [:enable, :start]
  supports :start => true, :stop => true, :restart => true, :reload => true, :status => true
end
