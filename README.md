# Azure Automation Lab: Bicep + Ansible + Bash

🚀 This project demonstrates **infrastructure automation** on **Azure** using a combination of **Bicep**, **Ansible**, and **Bash scripting**.  
It provisions infrastructure, configures servers, and deploys a **LAMP stack social platform application**.

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

```
azure-automation-lab/
│── ansible/
│ ├── playbooks/ # Ansible playbooks for VM and app setup
│ ├── roles/ # Roles for modular configuration
│ ├── inventory/ # Inventory files for targeting VMs
│── bash/
│ ├── setup.sh # VM initialization script
│ ├── cleanup.sh # Tear-down utilities
│── bicep/
│ ├── main.bicep # Main infrastructure definition
│ ├── modules/ # Reusable Bicep modules
│── docs/
│ ├── architecture.png # Project architecture diagram
│ ├── README.md # Project documentation
│── .gitignore
│── LICENSE
│── README.md
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

3. **Run Ansible Playbooks**

   ```bash
   ansible-playbook -i ansible/inventory/hosts ansible/playbooks/setup.yml
   ```

4. **Deploy the LAMP Application**

   ```bash
   ansible-playbook -i ansible/inventory/hosts ansible/playbooks/deploy-lamp.yml
   ```


## 📖 Documentation

For detailed usage, see:

 - [Ansible Playbooks](./ansible/playbooks/)
 - [Bicep Templates](./bicep/)
 - [Bash Scripts](./bash/)

## 📜 License

This project is licensed under the [MIT License](./LICENSE).