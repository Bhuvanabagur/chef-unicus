#
# Cookbook Name:: crontab
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'aptitude' do
  action :upgrade
end

# cron "attachments" do
#   minute "1"
#   hour   "2"
# 
#   user "root"
#   command "aptitude safe-upgrade -y > /dev/null 2>&1"
#   mailto "root"
# end


# cron "dropbox" do
#   not_if do
#     system("su haya -c 'crontab -l' | grep 'dropbox start'")
#   end
# 
#   minute "@reboot"
#   hour " "
#   day " "
#   month " "
#   weekday " "
# 
#   user "haya"
#   command "/usr/bin/dropbox start"
# end

# cron "growthforecast" do
#   not_if do
#     system("su haya -c 'crontab -l' | grep 'growthforecast.pl'")
#   end
# 
#   minute "@reboot"
#   hour " "
#   day " "
#   month " "
#   weekday " "
# 
#   user "haya"
#   command "/home/haya/perl5/perlbrew/perls/perl-5.16.3/bin/growthforecast.pl --data-dir ${HOME}/var/lib/growthforecast --allow-from 192.168.0.0/24 --allow-from 10.8.0.0/24 --allow-from 49.212.150.25 --port 4080"
# end

# cron "tweetbot" do
#   not_if do
#     system("su haya -c 'crontab -l' | grep 'run tweetbot'")
#   end
# 
#   minute "@reboot"
#   hour " "
#   day " "
#   month " "
#   weekday " "
# 
#   user "haya"
#   command "/home/haya/repos/boru-bot/run tweetbot"
# end
# 
# cron "borubot" do
#   not_if do
#     system("su haya -c 'crontab -l' | grep 'boru-bot/run worker --environment=production'")
#   end
# 
#   minute "@reboot"
#   hour " "
#   day " "
#   month " "
#   weekday " "
# 
#   user "haya"
#   command "/home/haya/repos/boru-bot/run worker --environment=production"
# end


# cron "backup dropbox" do
#   minute "30"
#   hour   "*/6"
# 
#   user "haya"
#   command "nice -n 19 /bin/bash /home/haya/Dropbox/backup-dropbox.sh > /dev/null"
# end

cron "daily du" do
  minute "0"
  hour   "3"

  user "haya"
  command "LANG=C nice -n 19 /usr/bin/du --max-depth=5 /home/haya > /home/haya/dulog 2>/dev/null"
end

cron "backup home" do
  minute "15"
  hour   "5"

  user "haya"
  command "/home/haya/backup-home.sh > /dev/null"
end

# cron "proximity check" do
#   minute "*"
# 
#   user "haya"
#   command "/home/haya/Dropbox/mail-proximity.sh"
# end
