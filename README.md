# valinor-infrastructure
valinor infrastructure.


## Components:
For this POC we will try to provision an RDS database and an ECS instances inside a vpc. We should be able to achieve something like this:
 image
 
 We will use terraform for this example. An interesting challenge is to decide how to structure the repo. By reading some docs and posts, 
 I will define modules per components and then import them in the `main.tf` file (network, instance, db, etc)
 
 Something like this (got it from https://medium.com/swlh/creating-an-instance-in-a-newly-designed-vpc-using-terraform-440a220d3886): 
    -- main.tf
    -- variables.tf
    -- terraform.tfvars
 -- modules (folder)
   --vpc (folder)
     -- vpc.tf
     -- variables.tf
     -- output.tf
   -- ...
 