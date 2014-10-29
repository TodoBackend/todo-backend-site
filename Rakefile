require 'microstatic/rake'

desc "deploy to todo-backend.thepete.net"
Microstatic::Rake.s3_deploy_task(:deploy) do |task|
  task.source_dir = File.expand_path("../public",__FILE__)
  task.bucket_name = "www.todobackend.com"
end

desc "ensure dependencies are all installed and ready for deployment"
task "build" do
  cd "public/client"
  sh "bower install -p"
end

desc "build, deploy"
task :build_and_deploy => [:build,:deploy]

task :default => :build_and_deploy
