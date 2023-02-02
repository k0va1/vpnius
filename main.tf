terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.0.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

provider "tls" {}

resource "digitalocean_droplet" "wireguard" {
  image = var.image
  name = var.name
  region = var.region
  size = var.size

  ssh_keys = [digitalocean_ssh_key.wireguard_key.id]

  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]

    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = tls_private_key.ssh.private_key_pem
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' --private-key id_rsa.pem playbook.yml"
  }
}

resource "local_file" "pem_file" {
  filename = "id_rsa.pem"
  file_permission = "600"
  directory_permission = "700"
  sensitive_content = tls_private_key.ssh.private_key_pem
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "digitalocean_ssh_key" "wireguard_key" {
  name       = "wireguard_key"
  public_key = tls_private_key.ssh.public_key_openssh
}

output "droplet_ip_address" {
  value = digitalocean_droplet.wireguard.ipv4_address
}
