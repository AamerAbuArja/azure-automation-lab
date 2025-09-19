Azure Web Server Infrastructure – Bicep Project Checklist
General Setup

- [ ] Create a new Bicep file (e.g., main.bicep)

- [ ] Define deployment parameters (location, admin username, SSH public key, etc.)

Networking
- [ ] Create a Virtual Network (VNet)

- [ ] Add a Subnet named webSubnet

- [ ] Create a Network Security Group (NSG)

  - [ ] Allow SSH (port 22)

  - [ ] Allow HTTP (port 80)

- [ ] Associate the NSG with the subnet or NIC (your choice)

Public IP & NIC
- [ ] Create a Public IP Address

- [ ] Create a Network Interface (NIC)

- [ ] Link it to the subnet

- [ ] Link it to the NSG

- [ ] Link it to the public IP

Virtual Machine
- [ ] Create a Linux Virtual Machine (Ubuntu)

- [ ] Use SSH key authentication

- [ ] Use cloud-init or customData to install Nginx

- [ ] Associate the NIC with the VM

Outputs
- [ ] Output the public IP address of the VM after deployment

Bonus / Optional
- [ ] Break the project into modules (e.g., network.bicep, vm.bicep)

- [ ] Add tags to all resources

- [ ] Use secure parameters for sensitive inputs (e.g., SSH key)

- [ ] Run az deployment group what-if before deploying

- [ ] Validate deployment with az deployment group validate