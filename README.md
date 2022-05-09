# terraform-kvm-MonolithProjects
Quick Start KVM libvirt Apache VMs with Terraform and Ansible

Instructions:

###################################################################################################################################

Step1: clone repo
Step2: Replace YourUserName in variables.tf with ${LOGNAME}
Step3: insert SSH keys into libvirt.tf
Step4: Upon first terraform init of MonolithProjects module,add below provisioner block to --> .terraform/modules/vm/main.tf

  provisioner "local-exec" {
    command = <<EOT
      echo "[apache]" > apache.ini
      echo "${self.network_interface.0.addresses.0}" >> apache.ini
      ansible-playbook -u ${var.ssh_admin} --private-key ${var.ssh_private_key} -i apache.ini ansible/playbook.yml
      EOT
  }

Step5: terraform init && terraform apply && terraform apply -auto-approve
  
###################################################################################################################################

Compiled with the help of the following resources:

https://blog.ruanbekker.com/blog/2020/10/08/using-the-libvirt-provisioner-with-terraform-for-kvm/
https://ostechnix.com/how-to-change-kvm-libvirt-default-storage-pool-location/
https://computingforgeeks.com/how-to-provision-vms-on-kvm-with-terraform/
https://www.desgehtfei.net/en/quick-start-kvm-libvirt-vms-with-terraform-and-ansible-part-1-2/
https://www.desgehtfei.net/en/quick-start-kvm-libvirt-vms-with-terraform-and-ansible-part-2/
https://linuxconfig.org/how-to-use-bridged-networking-with-libvirt-and-kvm
https://stackoverflow.com/questions/65945531/assign-static-dhcp-ip-from-the-hosts-network-to-kvm-vm-provosioned-by-terraform
