require 'microstatic/rake'

desc "deploy to todo-backend.thepete.net"
Microstatic::Rake.s3_deploy_task(:deploy) do |task|
  task.source_dir = File.expand_path("../public",__FILE__)
  task.bucket_name = "todo-backend.thepete.net"
end
