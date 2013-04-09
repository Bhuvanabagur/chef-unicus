require 'foodcritic'

task :default => [:foodcritic]

FoodCritic::Rake::LintTask.new do |t|
  t.options = {:fail_tags => ['any']}
  t.files = './site-cookbooks'
end

namespace :cookbook do
  desc 'Create a new cookbook'
  task :create do
    cookbook_name = ENV['name'] || 'new-cookbook'
    sh "bundle exec knife cookbook create -o site-cookbooks #{cookbook_name}"
  end
end

namespace :prepare do
  desc 'Prepare node: ichigo-dev'
  task :ichigo_dev do
    sh 'bundle exec knife solo prepare pi@ichigo-dev'
  end
end

namespace :cook do
  desc 'Cook node: vagrant'
  task :vagrant do
    sh 'bundle exec knife solo cook vagrant@10.8.1.10 --identity-file /home/haya/.vagrant.d/insecure_private_key'
  end

  desc 'Cook node: starfish'
  task :starfish do
    sh 'bundle exec knife solo cook haya@starfish'
  end

  desc 'Cook node: ichigo-dev'
  task :ichigo_dev do
    sh 'bundle exec knife solo cook pi@ichigo-dev'
  end

  desc 'Cook node: ichigo01'
  task :ichigo01 do
    sh 'bundle exec knife solo cook pi@ichigo01'
  end
end
