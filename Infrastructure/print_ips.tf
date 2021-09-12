# = = = Print public ips in hosts file for Ansible (Lab-1/Ansible/) = = =
data "template_file" "hosts" {
  template = file("./templates/hosts.tpl")
  vars = {
    NGINX = aws_instance.nginx.public_ip
    APP   = aws_instance.app.public_ip
    REDIS = aws_instance.redis.public_ip
  }
}

resource "local_file" "hosts_file" {
  content         = data.template_file.hosts.rendered
  filename        = "../Ansible/hosts"
  file_permission = "0664"
}
# = = = Print private ips (NGINX, REDIS, APP) for Ansible (Lab-1/Ansible/) = = =
data "template_file" "private_ip" {
  template = file("./templates/private_ip.tpl")
  vars = {
    NGINX        = aws_instance.nginx.private_ip
    NGINX_PUBLIC = aws_instance.nginx.public_ip
    APP          = aws_instance.app.private_ip
    REDIS        = aws_instance.redis.private_ip
  }
}

resource "local_file" "private_ip_file" {
  content         = data.template_file.private_ip.rendered
  filename        = "../Ansible/group_vars/ALL"
  file_permission = "0664"
}
