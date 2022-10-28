# **_Automatizer Windows Backup_**

###### <img src="https://wakatime.com/badge/github/kaka-jaques/automatizer-backup.svg"> count started 23/05/2022

#### * A batchfile to backup _Windows Files_  before format PC or Servers too (future release: script to backup Windows Server files automatically in a specific day time)

---

## - How to use:

- [X] **_Open with Administrator Privilegies_**

It's necessary to create backup folders and access Diskpart function, other PCs on LAN and verify Storage Size

<img src=.\img\adm-startup.png>

---

- [X] **_Select where the backup are made: L to use your Own Hard Drive & R for LAN Hosts_**

<img src=.\img\select.png>

---

- [X] **_Choose type of Backup: P to Default, E to Especific & F to Default Folders + Especific Folders_**

<img src=.\img\type.png>

## - For Local Hard Drive Backup:

- [X] **_Verification of free space: First of all, it's verify the space in your main storage, like C:\\_**

You can choose _Continue(C)_, _Close(S)_ or _Choose another Disk(D)_.

<img src=.\img\verify.png>

> - Choosing **_Continue_**
>> - It's select your main Hard Drive (C:\\), Shrink and Partition him at least 50GB and start to do the backup, if this can't be possible, the program close.
>
> - Choosing **_Close_**
>> - The Program just close :)
>
> - Choosing **_Another Disk_**
>> - The program list anothers Disks and Volumes connect in your PC to you choose according with number and start to do the backup

## - For LAN Hosts Backup

- [X] **_Write IP Address or PC's ID name: it's create the backup folder (called "BKP\_\<username>) on BKP\_Auto in a Shared Folder_**