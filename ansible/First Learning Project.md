### ✅ Azure LAMP Stack with Ansible — Checklist

1. Azure VM Setup
   - [x] Create Resource Group in Azure.
   - [x] Create a Virtual Network and Subnet.
   - [x] Create a Network Security Group (NSG) allowing:
     - [x] SSH (22)
     - [x] HTTP (80)
     - [x] Optional: HTTPS (443)
   - [x] Create Ubuntu VM (20.04 or 22.04) in Azure.
   - [x] Attach Public IP to the VM.
   - [x] Test SSH access from control machine.

2. Ansible Control Machine Prep
   - [x] Install Ansible on your control machine.
   - [x] Create a static inventory file (inventory.ini) with VM’s IP.
   - [x] Confirm Ansible connectivity:
   ``` bash
   ansible all -i inventory.ini -m ping
   ```

3. Project Structure
   - [x] Create roles/ directory:
     - [x] roles/apache
     - [x] roles/mysql
     - [x] roles/php
     - [x] roles/sample_app
   - [x] Create group_vars/all.yml for shared vars (e.g., DB credentials).
     - [x] add variables
   - [x] Create ansible.cfg to point to inventory and roles.
     - [x] add configuration

4. Role: Apache
   - [x] Install Apache using apt.
   - [x] Ensure service is enabled and running.
   - [x] Configure index.php location.
   - [x] Create handler to restart Apache if config changes.

5. Role: MySQL
   - [x] Install MySQL server.
   - [x] Create a database (lamp_db).
   - [x] Create a user (lamp_user) with password.
   - [x] Grant privileges to the user.
   - [-] Secure root password (optional: ansible-vault).

6. Role: PHP
   - [x] Install PHP and extensions (php-mysql, etc.).
   - [-] Configure PHP settings (optional).

7. Role: Sample App
   - [x] Create index.php file connecting to MySQL and showing data.
   - [x] Place it in /var/www/html.
   - [x] Verify file permissions.

8. Playbooks
   - [x] Create site.yml that calls:
     - [x] apache
     - [x] mysql
     - [x] php
     - [x] sample_app
   - [x] Run:
   ``` bash
   ansible-playbook -i inventory.ini site.yml
   ```

9. Testing
   - [x] Open browser → http://<VM_Public_IP> → should load the PHP app.
   - [x] Test DB connection from PHP page.
   - [x] SSH into VM and verify services are running:
   ``` bash
   systemctl status apache2
   systemctl status mysql
   ```

10. Optional Enhancements
    - [ ] Use ansible-vault for DB password encryption.
    - [x] Use templates/ with Jinja2 for config files.
    - [x] Add firewall role to manage UFW.
    - [ ] Add Let's Encrypt SSL with certbot.