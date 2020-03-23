# Cloud Pak for Data installer for IBM Cloud

This repository houses a set of automation for deploying infrastructure, openshift, and cloud pak for data.

<b>Prerequisites</b>

- Ansible
- terraform > 0.12
- [ibmcloud provider](https://github.com/IBM-Cloud/terraform-provider-ibm)
  
<b>Files required</b>

in a folder in the root of this repository called `installer_files` place 2 files for cloud pak install:

- cloudpak4data-ee-v2.5.0.0.tgz
- repo.yaml

<b>Variables</b>

There are a few variables that must be set for the install to take place successfully.

- ibmcloud_api_key
- iaas_classic_username
- iaas_classic_api_key
- redhat_un
- redhat_pw
- openshift_pool_id (a rhsm pool with the appropriate licenses)
- domain (a domain that already exists in IBM Cloud)
  
Additionally it is recommended to set additional variables:

- ssh-key (a list of strings with the ID of an ssh key already in IBM Cloud)
- cluster_name (a random string, used for your cluster URL)
- region
- datacenter
- tags (a list of strings of tags to apply to the infrastructure)

<b>Deployment</b>

To run this deployment run this series of commands from the root folder

```
terraform init
terraform plan #check your plan is as expected
terraform apply
ansible-playbook main.yaml
```

due to some complications with the deployment of ocp the last command must be run from the installer node provisioned during the deployment.
This command will also be printed at the end of the previous playbook

```
ssh root@<installer_ip> -i <project_dir>/installer_files/id_rsa
ansible-playbook /opt/installer/main.yaml
```

<b>Post Install</b>

Your cluster will be up and available at a url with this format
`https://console.apps.<cluster_name>.<domain>`

The default credentials are:
```
username: ocpadmin
password: Ch4ngeM3
```