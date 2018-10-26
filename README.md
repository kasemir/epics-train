# epics-train
Resources for EPICS Introduction.
Started as V4 and CSS introduction at EPICS meeting,
then updated for other training sessions.

# Virtual Linux Server Setup
Download VirtualBox and also the VirtualBox Extension Pack from https://www.virtualbox.org/wiki/Linux_Downloads .

`sudo rpm --install VirtualBox-5.2-5.2.18_124319_el7-1.x86_64.rpm`

Add yourself to group required to run vbox
`sudo /usr/sbin/groupadd vboxusers`
`sudo /usr/sbin/usermod -G vboxusers $USER`
 
Start VirtualBox

# Training VM
Create new VM
```
Name: Training
Type: Linux
Version: RedHat (64-bit)
Memory Size: 3094 MB
Disk: VDI, dynamically allocated, 20GB
```

Update VM settings to use several CPU cores.

Start up with `CentOS-7-x86_64-DVD-1804.iso`:
When starting VM for the first time, VirtualBox will prompt for an image.
To boot from ISO image later, open Settings, Storage, Controller: IDE "Empty", press icon to select Centos ISO, then start the VM.

Software Selection: "GNOME Desktop" with add-ons
 * GNOME Applications
 * Development Tools

Would like to _not_ install these, to be removed later:
 * LibreOffice
 * Brasero, Rythmbox, shotwell

Network & Host name: Turn ethernet "on", hostname `training.epics`.

Select the storage/target disk, begin installation. While that is progressing for quite some time,
use UI options to set root password to `$root`. Add user `training`, pass `$training` and add group `wheel`

Reboot VM.

Log in as `training` user.

In the VirtualBox menu, select `Devices`, `Insert Guest Additions CD Image`.
This should automatically execute 
```
sudo /run/media/training/VB*/VBoxLinuxAdditions.run
```

(In one case, display now turned into gibberish. Power VM off, restart).

"Eject" the guest additions CD.

Applications, System Tools, Settings:
Under Details, Users, select Automatic Login for the 'training' user.
(Seemed to reset to no-automatic-login.
 Try also via the 'power' button in toolbar, training, Account Settings)
Under Power, set Blank Screen to 'Never' and turn Automatic Suspend off.

Restart VM once more. The VM's display will now follow the size of the host window.

In case 'ssh' access is required from the host:
Open VirtualBox Devices, Network, Network Settings, Adapter 1 (NAT), Advanced, Port Forwarding.
Add a new rule from host 127.0.0.1:2200 to guest 10.0.2.15:22.
Host can now access VM via `ssh -p 2200 training@localhost`.


# Training Setup

Log on as user training, pass $training, then
```
git clone https://github.com/kasemir/epics-train.git
```

Invoke Applications, Utilities, Tweak Tool.
Configure Desktop, Background: Use epics-train/EPICS.png, centered
Configure Windows, Titlebar, Middle Click: Lower

