**Packer**

# Install Packer

Use [install-packer][] playbook to install packer

```console
thy@tdeltd:~$ packer version
Packer v1.1.0
```

[install-packer]: https://github.com/thydel/misc-play/blob/master/install-packer.yml "github.com"

# Install vmware-workstation

- Use [install-vmware-workstation playbook][] to install vmware-workstation
- See [install-vmware-workstation doc][]

basically

```
export LD_LIBRARY_PATH=/usr/lib/vmware/lib/libatspi.so.0:/usr/lib/x86_64-linux-gnu/gtk-2.0/modules:$LD_LIBRARY_PATH
vmplayer
```

[install-vmware-workstation playbook]:
	https://github.com/thydel/misc-play/blob/master/install-vmware-workstation.yml "github.com"

[install-vmware-workstation doc]:
	https://github.com/thydel/misc-play/blob/master/install-vmware-workstation.md "github.com"

# Configure AWS

```
sudo aptitude install awscli
aws configure --profile epi
aws configure --profile perso
export AWS_DEFAULT_PROFILE=epi
aws ec2 describe-instances
```
