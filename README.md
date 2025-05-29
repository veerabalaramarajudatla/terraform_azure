# terraform_azure


Step 1:
Created the App Registration with Single Tentant (terraform-ap-using-github)

Step 2:
Creation of Client Secerts

Step 3:
Creation of the User with help of the subscription (IAM Role)
Role -> Contributor
Assign -> User, Groups or Service principal
Member -> We need to add our Application Name

Step 4:
We will get Client ID, Tentant ID from the App Registration


# Topic Covered

--> Git Hub Actions for terraform plan and apply

--> Resource Group Creation
(Resource Group and Location)

--> Creation of v-net and sub-net
(Resource Group, Location and Address)

--> Creation of VM
(Resource Group, Location, Vnet, Snet, Network Interface Card, public ip, user, ssh key, size, type of os and os image)

--> Network Security Group
(Resource Group, Location and Security Rule(direction, protocol, port, etc..))

--> Load Balancer
(Creating of one more VM and Setting up the load balancer)

# Resource

Backend terraform -> To get the State and Lock file to store the history

Platform -> Azure

Resource Group -> 1

Virtual Network -> 1

Subnet -> 1

Peering between Vnet

Network Security Group -> 1

Network Interface Card -> 2

Joined the Network Interface card and Network Security Group using Network Interface Security Group Association

Virtual Machine -> 2

Virtual Machine are attached with the Network Interface Card Respectively

SSH Key created from old VM