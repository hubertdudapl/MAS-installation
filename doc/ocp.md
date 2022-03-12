# OpenShift bare-metal
There is a ready-to-use tool called gi-runner prepared by my colleague Zbyszek Szmigiero which allows for OpenShift installation bare-metal, connected or disconnected (air-gap), flexible architecture, storage etc.. For dedicated Cloud Providers or with virtualization managers like vSphere installation is quite straightforward with the standard installer.  
The tool and very comprehensive instruction materials prepared by Zbyszek:
- [Tool](https://github.com/zbychfish/gi-runner)
- [Manual](https://guardiumnotes.wordpress.com/2021/09/09/automation-of-openshift-and-guardium-insights-installation-on-bare-metal/#1b)
- [Instructional video](https://www.youtube.com/watch?v=i3HqJqFvs2s&t=1226s)
## My example
Only OpenShift installation bare-metal, no ICS or Gardium. Storage Rook using second disk attached to worker nodes.
### Required data (you have to gather before starting an installation)
1. **Example machines configuration data, here for 3 master + 3 worker nodes**
  
| Name         | IP             | MAC               |  DNS                       |Ethernet   |sda (GB) |sdb (GB)|
| :---         |     :---:      |     :---:         |     :---:                  |   :---:   |   :---: | :---:  |
| bastion      | 192.168.5.89   | DA:5D:C4:B8:76:2B |bastion.ocp3.hdmasdemo.pl   |ens18      | 300     |   -    |
| bootstrap    | 192.168.5.90   | 22:5C:8D:46:E2:09 |bootstrap.ocp3.hdmasdemo.pl |           | 120     |   -    |
| master 1     | 192.168.5.91   | 66:87:42:30:3D:67 |m1.ocp3.hdmasdemo.pl        |           | 120     |   -    |
| master 2     | 192.168.5.92   | 8A:2F:B2:0F:A5:46 |m2.ocp3.hdmasdemo.pl        |           | 120     |   -    |
| master 3     | 192.168.5.93   | 66:81:72:30:3D:67 |m3.ocp3.hdmasdemo.pl        |           | 120     |   -    |
| worker 1     | 192.168.5.94   | AE:73:91:40:06:42 |w3.ocp3.hdmasdemo.pl        |           | 120     |   500  |
| worker 2     | 192.168.5.95   | 4A:86:09:7E:69:D7 |w3.ocp3.hdmasdemo.pl        |           | 120     |   500  |
| worker 3     | 192.168.5.64   | B6:B3:9D:10:F2:A6 |w3.ocp3.hdmasdemo.pl        |           | 120     |   500  |
- **names** - your preference
- **ip** - adequate to your infrastructure, your choice
- **MAC** - write down after creation of VMs ( or hardware )
- **DNS** - domain name and machines names are your choice ( if you have your own certificate you have to choose sth what is covered by it )
- **Ethernet** - operating system name of the ethernet card ( I take it from bastion - Fedora Server )
- **sds** - system hard disk
- **sdb** - secondary hard disk for Rook ( storage class )
2. **[Red Hat pull secret]**(https://console.redhat.com/openshift/install/pull-secret)
![Red Hat download pull secret page](/img/rh-pull-secret.png)
3. **Time server IP**  
Check which server is e.g. standard for your country and provide it ( e.g. 194.146.251.100 for Poland )
4. **DNS server**  
9.9.9.9 or of what you prefere
### Instalation
1. **Download tool**
```bash
cd ~
dnf -y install git
git clone https://github.com/zbychfish/gi-runner.git
```
2. **Start scripts which will gather installation parameters:**
```bash
cd ~/gi-runner
init.sh
```
Bastion would be rebooted so login again.
| NOTICE |
|--------|
|Remember to run source variables.sh after login, before runining ansible playbook.|
3. **Start OCP installation palybook**
```bash
cd ~/gi-runner
source variables.sh
ansible-playbook playbook/install_all.yaml
```
#### My example installation session (only 3 master/worker nodes) [video](https://youtu.be/GUTF_m9SUWw)

#### More details e.g. bastion os installation etc. look at Zbyszek's materials  
- [Manual](https://guardiumnotes.wordpress.com/2021/09/09/automation-of-openshift-and-guardium-insights-installation-on-bare-metal/#1b)  
- [Instructional video](https://www.youtube.com/watch?v=i3HqJqFvs2s&t=1226s)

