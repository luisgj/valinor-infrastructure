# Valinor Infrastructure
  
 This project tries to create resources to achieve the infrastructure in this diagram: 
 ![diagram](images/components.png "diagram_components")
  
The structure of the project will be with modules separated by layer (network, storage, instances, etc).

To connect the EC2 instance to the internet we will have to add a few more resources. This is because provisioning an instance inside a private subnet and a vpc will leave an isolated instance and nothing to tell the system what ports are open and allowed and there is no path to route traffic to and from the internet as there is no public gateway to route it to. To allow internet access:

- `aws_subnet (public)`: Associates a public ip address inside the public subnet we use the subnet to do this automatically.
- `internet_gateway`: A way to open the subnet to the internet
- `default_route_table`: To point the traffic through the gateway
- `security_group`: To define the rules of outbound, inbound, protocols and ports through the subnet (we are also allowing ssh access).

This will make our subnet public and grant us access to and from the internet inside the EC2.

To create the database there need to be at least two different subnets in at least two availability zones. To create the database:

- `subnets`: In two different availability zones
- `subnet_group`: the list of the subnets to use for the db
- `aws_db_instance`: mysql community engine rds db
