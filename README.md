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

Start up with `CentOS-7-x86_64-DVD-1804.iso`

Software Selection: "GNOME Desktop" with add-ons
 * GNOME Applications
 * Development Tools

Would like to _not_ install these, to be removed later:
 * LibreOffice
 * Brasero, Rythmbox, shotwell

Network & Host name: Turn ethernet "on", hostname `training.epics`

Users: Set root password to `$root`. Add user `training`, pass `$training` and add group `wheel`

Reboot VM.

In the VirtualBox menu, select `Devices`, `Insert Guest Additions CD Image`.
Log in as `training` user, then
```
sudo /run/media/training/VBOXADDITIONS*/VBoxLinuxAdditions.run
```

Applications, System Tools, Settings:
Under Users, select Automatic Login for the 'training' user.
Under Power, set Blank Screen to 'Never' and turn Automatic Suspend off.

Restart VM once more. The VM's display will now follow the size of the host window.


# Training Setup

Log on as user training, pass $training, then
```
git clone https://github.com/kasemir/epics-train.git
```

Invoke Applications, Utilities, Tweak Tool.
Configure Desktop, Background: Use epics-train/EPICS.png, centered
Configure Windows, Titlebar, Middle Click: Lower

