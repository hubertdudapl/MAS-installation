### MAS Manage installation
You can install various MAS applications using Ansible playbooks provided by MAS Devops Collection e.g Manage. [steps here](https://ibm-mas.github.io/ansible-devops/playbooks/lite-manage-roks/)  
I have never used it because my infrastructure is too small for using CP4D and DB2 Warehouse cluster, but if yours is enough you can try.  
  
There are videos showing how to install and configure MAS Manage
- **MAS Manage Installation Deployment Part 1** [video](https://www.youtube.com/watch?v=L5J370gslw8)  
- **MAS Manage Deployment and Activation Installation Part 2** [video](https://www.youtube.com/watch?v=4xFlrfXxpdg)  
- **MAS Manage Validate Installation Login as Maxadmin Part 3** [video](https://www.youtube.com/watch?v=nm31i5g4rbs)  

So as you can see there are enough materials available on how to install MAS Manage and I am not going to duplicate them, but I only want to show you how can you spare hardware using a small DB2 instance on OpenShift.  
Of course, such an approach is not recommended for production environment purposes but only for test or development.

|NOTICE|
|------|
|Remember that you have to be logged in to OpenShift|
1.  Start the script with the command (alternatively you can set an executable flag with _chmod +x mas/db2-maxdb.sh_ command and run _mas/db2-maxdb.sh_):
```bash
source mas/db2-maxdb.sh
```
2. Wait until the db2 pod is in running status.  

![db2 pod status](../img/db2-pod.png)  

```yaml
  - env:
          - name: DB2INST1_PASSWORD
            value: passw0rd
```
You can change the password for db2inst1 user in db2-maxdb.yaml file, look at excerpt above. Of course, you have to do that before running _source db2-maxdb.sh_.  

3. Carry out the database configuration in a way recommended by the official documentation, using db2inst1/passw0rd credentials (64-bit UNIX).[link](https://www.ibm.com/docs/en/maximo-manage/8.2.0?topic=deployment-configuring-db2)  
You don't have to create a new instance you can use the present one db2inst1.  

4. Complete the setup according to the videos at the top of the page.
