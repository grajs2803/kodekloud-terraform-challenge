resource "docker_container" "php-httpd" {
  name  = "webserver"
  image = docker_image.php-httpd-image.image_id
  hostname = "php-httpd"
  
  networks_advanced{
    name = "my_network"

  }
  ports{
    ip = "0.0.0.0"
    external = 80
    internal = 80
  }
  labels{
    challenge = "second"
  }
  volumes{
    host_path = "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
    container_path = "/var/www/html"
  }
}


resource "docker_container" "mariadb" {
  name  = "db"
  image = docker_image.mariadb-image.image_id
  hostname = "db"
  env = ["MYSQL_ROOT_PASSWORD=1234","MYSQL_DATABASE=simple-website"]
  networks_advanced{
    name = "my_network"

  }
  ports{
    ip = "0.0.0.0"
    external = 3306
    internal = 3306
  }
  labels{
    challenge = "second"
  }
  volumes{
    volume_name = docker_volume.mariadb_volume.name
    container_path = "/var/lib/mysql"
  }
}



resource "docker_container" "phpmyadmin" {
  name  = "db_dashboard"
  image = "phpmyadmin/phpmyadmin"
  hostname = "phpmyadmin"
  
  networks_advanced{
    name = "my_network"

  }
  ports{
    ip = "0.0.0.0"
    external = 8081
    internal = 80
  }
  labels{
    challenge = "second"
  }
  volumes{
    host_path = "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
    container_path = "/var/www/html"
  }

  depends_on = [ docker_container.mariadb ]

}





