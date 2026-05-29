regions = {
  admin = "us-west-2"
  dev   = "us-west-2"
  qa    = "us-west-2"
}
environment = {
  admin = {
    region = "us-west-2"
    azs = [
      "us-west-2a",
      "us-west-2b",
      "us-west-2c"
    ]
    vpc_conf = {
      vpc_cidr_block   = "10.0.0.0/16"
      private_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
      public_subnets   = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
      database_subnets = ["10.0.201.0/24", "10.0.202.0/24", "10.0.203.0/24"]
    }
  }
  dev = {
    region = "us-west-2"
    azs = [
      "us-west-2a",
      "us-west-2b",
      "us-west-2c"
    ]
    vpc_conf = {
      vpc_cidr_block   = "10.1.0.0/16"
      private_subnets  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
      public_subnets   = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]
      database_subnets = ["10.1.201.0/24", "10.1.202.0/24", "10.1.203.0/24"]
    }
  }
  qa = {
    region = "us-west-2"
    azs = [
      "us-west-2a",
      "us-west-2b",
      "us-west-2c"
    ]
    vpc_conf = {
      vpc_cidr_block   = "10.2.0.0/16"
      private_subnets  = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
      public_subnets   = ["10.2.101.0/24", "10.2.102.0/24", "10.2.103.0/24"]
      database_subnets = ["10.2.201.0/24", "10.2.202.0/24", "10.2.203.0/24"]
    }
  }
}