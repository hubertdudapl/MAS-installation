### MAS Manage installation
You can install various MAS applications using Ansible playbooks provided [here](https://ibm-mas.github.io/ansible-devops/)  
I have never used it because my infrastructure is too short for using CP4D and DB2 Warehouse cluster, but if yours is enough you can try.  
  
There are videos showing how to install and configure Manage
- **Manage Installation Deployment Part 1** [video](https://www.youtube.com/watch?v=L5J370gslw8)  
- **Maximo Manage Deployment and Activation Installation Part 2** [video](https://www.youtube.com/watch?v=4xFlrfXxpdg)  
- **Maximo Manage Validate Installation Login as Maxadmin Part 3** [video](https://www.youtube.com/watch?v=nm31i5g4rbs)  

So as you can see there are enough materials available on how to install MAS Manage and I am not going to duplicate them, but I only want to show you how can you spare hardware using a small DB2 instance on OpenShift.  
Of course, such an approach is not recommended for production environment purposes but only for test or development.
