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

resource "docker_image" "image_id" {
  name = "ghost:latest"
}

# Start the Container
resource "docker_container" "container_id" {
  name  = "blog"
  image = "${docker_image.image_id.latest}"
  ports {
    internal = "2368"
    external = "80"
  }
}


