# epics-train
Resources for V4 and CSS introduction at EPICS meeting

# Virtual Linux Server Setup

Download VirtualBox-5.1-5.1.18_114002_el6-1.x86_64.rpm 

`sudo rpm --install VirtualBox-5.1-5.1.18_114002_el6-1.x86_64.rpm`

Add yourself to group required to run vbox
`sudo /usr/sbin/groupadd vboxusers`

Start VirtualBox

# Training VM
Create new VM
```
Name: Training
Type: Linux
Version: RedHat (64-bit)
Memory Size: 3094 MB
Disk: VDI, 15GB
```

Start up with `CentOS-7-x86_64-DVD-1611.iso`

Software Selection: "GNOME Desktop" with add-ons
 * GNOME Applications
 * Development Tools

Network & Host name: Turn ethernet "on", hostname `training.epics`

Users: Set root password to `$root`. Add user `training`, pass `$training` and add group `wheel`


# Training Setup

Log on as user training, pass $training, then
```
git clone https://github.com/kasemir/epics-train.git
```
