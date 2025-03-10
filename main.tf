terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "1.212.0"
    }
  }
}

provider "alicloud" {
  region = "cn-hangzhou"
}

resource "alicloud_vpc" "vpc" {
  vpc_name   = "tf_test_foo"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "vsw" {
  vpc_id     = alicloud_vpc.vpc.id
  cidr_block = "172.16.0.0/21"
  zone_id    = "cn-hangzhou-b"
}

resource "alicloud_security_group" "default" {
  name   = "default"
  vpc_id = alicloud_vpc.vpc.id
}
