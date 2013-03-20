require 'foodcritic'

task :default => [:foodcritic]

FoodCritic::Rake::LintTask.new do |t|
  t.options = {:fail_tags => ['any']}
  t.files = './site-cookbooks'
end

namespace :cook do
  desc 'Cook node: starfish'
  task :starfish do
    sh 'bundle exec knife solo cook haya@starfish'
  end
end
