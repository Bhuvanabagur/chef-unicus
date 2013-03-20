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

namespace :cook do
  desc 'Cook node: starfish'
  task :starfish do
    sh 'bundle exec knife solo cook haya@starfish'
  end

  desc 'Cook node: ichigo'
  task :ichigo do
    sh 'bundle exec knife solo cook pi@ichigo01'
  end
end
