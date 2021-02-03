# Set the required provider and versions
terraform {
  required_providers {
    # We recommend pinning to the specific version of the Docker Provider you're using
    # since new versions are released frequently
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.8.0"
    }
  }
}

# Configure the docker provider
provider "docker" {
}
#**** ---> up-to-date terraform syntax <--- ****
# # Create a docker image resource
# # -> docker pull nginx:latest
# resource "docker_image" "image_id" {
#   name         = "ghost:latest"
#   keep_locally = false
# }

# # Create a docker container resource
# # -> docker run --name foo -d nginx:latest
# resource "docker_container" "image_id" {
#   name    = "ghost"
#   image   = docker_image.image_id.latest
#   ports {
#       internal = "2368"
#       external = "80"
#   }
# }

#**** ---> depracated terraform syntax <--- ****
# resource "docker_image" "image_id" {
#   name = "ghost:latest"
# }

# # Start the Container
# resource "docker_container" "container_id" {
#   name  = "blog"
#   image = "${docker_image.image_id.latest}"
#   ports {
#     internal = "2368"
#     external = "80"
#   }
# }


#**** ---> using variables with terraform syntax <--- ****
# variable "container_name" {
#   description = "Name of container"
#   default = "blog"
# }
# variable "image" {
#   description = "image for container"
#   default = "ghost:latest"
# }
# variable "int_port" {
#   description = "internal port for container"
#   default = "2368"
# }
# variable "ext_port" {
#   description = "external port for container"
#   default = "80"
# }

# Download the latest Ghost Image
resource "docker_image" "image_id" {
  name = "${var.image}"
}
# Start the Container
resource "docker_container" "container_id" {
  name  = "${var.container_name}"
  image = "${docker_image.image_id.latest}"
  ports {
    internal = "${var.int_port}"
    external = "${var.ext_port}"
  }
}

