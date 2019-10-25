#provider "sakuracloud" {
#}

data sakuracloud_archive "ubuntu" {
    filter = {
        name = "Name"
        values = ["Ubuntu Server"]
    }
    filter = {
        name = "Tags"
        values = ["current-stable","arch-64bit","os-linux"]
    }
}

resource "sakuracloud_disk" "disk01" {
  name              = "disk01"
  source_archive_id = "${data.sakuracloud_archive.ubuntu.id}"
}

resource "sakuracloud_server" "server01" {
  name  = "server01"
  disks = ["${sakuracloud_disk.disk01.id}"]
  password          = "YourPassw0rd"
}
