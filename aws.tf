variable "atlas_token" {
    type = "string"
}

provider "atlas" {
    token = "${var.atlas_token}"
}

# Fetch an artifact configuration
data "atlas_artifact" "cloudbreak" {
    name = "sequenceiq/cloudbreak"
    type = "amazon.image"
    metadata {
        prometheus = "true"
    }
}

provider "aws" {
    region = "eu-west-1"
}

resource "aws_instance" "cloudbreak" {
    #ami = "${data.atlas_artifact.cloudbreak.metadata_full.region-us-west-2}"
    ami = "ami-297d2b5a"
    instance_type = "m3.medium"
    key_name = "seq-master"
    tags {
        owner = "lpapp"
        Name = "prometheus"
    }
}

output ssh {
     value = "ssh cloudbreak@${aws_instance.cloudbreak.public_ip}"
}
