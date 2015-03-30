require 'microstatic/rake'

desc "deploy to www.todobackend.com"
Microstatic::Rake.s3_deploy_task(:deploy) do |task|
  task.source_dir = File.expand_path("../build",__FILE__)
  task.bucket_name = "www.todobackend.com"
end

desc "deploy to preview.todobackend.com"
Microstatic::Rake.s3_deploy_task(:deploy_preview) do |task|
  task.source_dir = File.expand_path("../build",__FILE__)
  task.bucket_name = "preview.todobackend.com"
end

task "bower" do 
  cd "source/client"
  sh "bower install -p"
end

desc "serve a local development version of the site"
task "serve" do
  sh "middleman server"
end

task "middleman-build" do
  sh "middleman build"
end

desc "ensure dependencies are all installed and ready for deployment"
task "build" => ["bower","middleman-build"]

desc "build, deploy"
task :build_and_deploy => [:build,:deploy]

task :default => :build
