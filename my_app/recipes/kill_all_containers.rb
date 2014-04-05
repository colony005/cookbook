script "kill_all_containers" do  
  interpreter "ruby"
  user "root"
  code <<-EOH
    `docker ps -q`.split("\n").each do |container_id|
      `docker stop \#{container_id}`
    end
    `docker ps -a -q`.split("\n").each do |container_id|
      `docker rm \#{container_id}`
    end
  EOH
end  
