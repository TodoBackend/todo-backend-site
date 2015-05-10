desc "deploy to a commit-specific todobackend.com subdomain"
task 'deploy_commit_preview', :commit_id do |task,args|
  raise "must specify a commit_id" unless args.has_key?(:commit_id)

  zone_name = "todobackend.com"
  site_name = "#{args[:commit_id]}.preview.todobackend.com"
  source_dir =  File.expand_path("../../build",__FILE__)
  aws_creds = Microstatic::Config.automagic.aws_creds

  puts "setting up commit-specific preview at #{site_name}..."
  puts
  puts "creating bucket..."
  Microstatic::S3BucketCreator.new( aws_creds ).create( site_name )

  puts "setting up DNS..."
  Microstatic::Route53Dns.new( aws_creds ).add_s3_record_for_bucket( site_name, zone_name )

  puts "deploying files to bucket..."
  Microstatic::S3Deployer.build( source_dir, site_name, aws_creds ).upload

  puts "done!"
end
