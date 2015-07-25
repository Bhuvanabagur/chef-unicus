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

cron "dropbox" do
  not_if do
    system("su haya -c 'crontab -l' | grep 'dropbox start'")
  end

  minute "@reboot"
  hour " "
  day " "
  month " "
  weekday " "

  user "haya"
  command "/usr/bin/dropbox start"
end

cron "daily du" do
  minute "0"
  hour   "3"

  user "haya"
  command "LANG=C nice -n 19 /usr/bin/du --max-depth=5 /home/haya > /home/haya/dulog 2>/dev/null"
end

cron "backup dropbox" do
  minute "30"
  hour   "23"

  user "haya"
  command "nice -n 19 /bin/bash /home/haya/dropbox/backup-dropbox.sh > /dev/null"
end

cron "report dropbox stat to growthforecast" do
  minute "0"
  hour   "*/6"

  user "haya"
  command "/home/haya/dropbox/etc/unicus/dropbox-stat"
end


# cron "download radio movies" do
#   minute "0"
#   hour   "*/6"
# 
#   user "haya"
#   command "/home/haya/dropbox/Music/radio/download.sh"
# end

cron "RAID scrubbing: md0" do
  minute "0"
  hour   "5"
  weekday "6"

  user "root"
  command "/bin/echo check > /sys/block/md0/md/sync_action"
end

cron "RAID scrubbing: md1" do
  minute "0"
  hour   "5"
  weekday "6"

  user "root"
  command "/bin/echo check > /sys/block/md1/md/sync_action"
end

cron "tweetbot" do
  not_if do
    system("su haya -c 'crontab -l' | grep 'run tweetbot'")
  end

  minute "@reboot"
  hour " "
  day " "
  month " "
  weekday " "

  user "haya"
  command "/home/haya/repos/boru-bot/run tweetbot"
end

cron "borubot" do
  not_if do
    system("su haya -c 'crontab -l' | grep 'boru-bot/run worker --environment=production'")
  end

  minute "@reboot"
  hour " "
  day " "
  month " "
  weekday " "

  user "haya"
  command "/home/haya/repos/boru-bot/run worker --environment=production"
end

# cron "wakeup suzuki" do
#   minute	"0"
#   hour		"23"
#   day		"*"
#   month	"*"
#   weekday	"*"
# 
#   user "haya"
#   command "/usr/bin/wakeonlan 00:08:9b:ce:b5:78"
# end
# 
# cron "sleep suzuki" do
#   minute	"0"
#   hour		"9-20"
#   day		"*"
#   month	"*"
#   weekday	"*"
# 
#   user "haya"
#   command "ssh admin@suzuki.unicus.ddo.jp /etc/init.d/pw_sleep.sh"
# end

# cron "proximity check" do
#   minute "*"
# 
#   user "haya"
#   command "/home/haya/dropbox/mail-proximity.sh"
# end
