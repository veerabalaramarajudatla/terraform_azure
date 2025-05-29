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