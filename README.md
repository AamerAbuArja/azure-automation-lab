# Azure Automation Lab: Bicep + Ansible + Bash

🚀 This project demonstrates **infrastructure automation** on **Azure** using a combination of **Bicep**, **Ansible**, and **Bash scripting**.  
It provisions infrastructure, configures servers, and deploys a **LAMP stack social platform application**.

Please Note:

 - This was just a lab project for me to test my skills mainly on Ansible and Bash
 - The work is not completely professional and there are things I'm doing in Bash that I could easily do in Ansible
 - I choose to put my skills to the test on All areas of this project
 - This project does not save records into a unified database but rather saves everything locally
 - 

---

## 📑 Project Overview

- **Infrastructure Deployment (Bicep):**
  - Deploys **3 Ubuntu virtual machines** on Azure.
  - Configures networking and resource group setup.
  - Modular Bicep templates for reusability.

- **Configuration Management (Ansible + Bash):**
  - Configures base OS settings with Ansible roles.
  - Executes Bash scripts for additional server setup and utilities.
  - Automates package installation and system hardening.

- **Application Deployment (Ansible):**
  - Deploys a **social platform app** built on the **LAMP stack (Linux, Apache, MySQL, PHP)**.
  - Configures Apache virtual hosts and MySQL database.
  - Ensures idempotent deployments for repeatable results.

---

## 📂 Repository Structure

```html
azure-automation-lab/
├── ansible
    ├── ansible.cfg
    ├── group_vars
    ├── inventory
    ├── playbooks
    └── roles
    │   ├── apache
    │   ├── mysql
    │   ├── php
    │   └── social_app
├── bash
├── bicep
├── LICENSE
├── README.md
└── .gitignore
```


---

## 🛠️ Technologies Used

- **Azure Bicep** → Infrastructure-as-Code (IaC) for VM provisioning.  
- **Ansible** → Configuration management and LAMP deployment.  
- **Bash** → Utility scripts for provisioning and automation.  
- **Azure** → Cloud provider for hosting infrastructure.  
- **LAMP Stack** → Social platform application deployment.  

---

## 🚀 How to Use

1. **Clone the repository**

   ```bash
   git clone https://github.com/<your-username>/azure-automation-lab.git
   cd azure-automation-lab
   ```

2. **Deploy Infrastructure with Bicep**

   ```bash
   az deployment group create \
    --resource-group <your-rg> \
    --template-file bicep/main.bicep
   ```

3. **Run Playbook to Install LAMP Stack**

   ```bash
   ansible-playbook -i ansible/inventory/inventory.ini ansible/playbooks/full_lamp_install.yml
   ```

4. **Run Playbook to Setup LAMP Stack**

   ```bash
   ansible-playbook -i ansible/inventory/inventory.ini ansible/playbooks/full_lamp_setup.yml
   ```

5. **Deploy the LAMP Application**

   ```bash
   ansible-playbook -i ansible/inventory/inventory.ini ansible/playbooks/lamp-site.yml
   ```


## 📖 Documentation

For detailed usage, see:

 - [Ansible Playbooks](./ansible/playbooks/)
 - [Bicep Templates](./bicep/)
 - [Bash Scripts](./bash/)

## 📜 License

This project is licensed under the [MIT License](./LICENSE).