#
# Cookbook:: deployer
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#install docker
docker_service 'default' do
  action [:create, :start]
end
#install git
git_client 'default' do
  action :install
end
#clone from git and build image
bash 'clone_from_git' do
  user 'root'
  cwd '/home/vagrant'
  code <<-EOH
  rm -rf devops_training
  git clone -b task7 https://github.com/mdanilchenko/devops_training.git
  docker build devops_training/task7/ -t tomcat_env#{node['training']['build_version']}
  EOH
end

free_port = '8080'
other_port = '8081'
#select free port to run new app
bash 'get_ports_info' do
  user 'root'
  cwd '/home/vagrant'
  code <<-EOH
  docker ps --format "{{.Names}}" > 'ports.txt'
  EOH
end
if File.exist? File.expand_path "/home/vagrant/ports.txt"
  file = File.open("/home/vagrant/ports.txt", "rb")
  contents = file.read

  if contents.include? "8080"
     other_port = "8080"
     free_port = "8081"
  end
end

# Run container exposing ports
docker_container "task_#{free_port}" do
  repo "tomcat_env#{node['training']['build_version']}"
  tag 'latest'
  port "#{free_port}:8080"
end

#Stop another container
docker_container "task_#{other_port}" do
  action [:stop, :delete]
end
