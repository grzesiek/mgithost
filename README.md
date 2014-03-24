mgithosting-scripts
===================

Minimalistic approach for website hosting under GIT revision control


Description
-------------

- *mgithosting* allows you to create accounts for websites that are controlled by non-shared GIT revision controll system
- users can access ther accounts only through jailed sftp subsystem
- accounts are separated by Apache ITK priviledge separation mechanisms
- changes in repositories are commited periodically through cron
- sysadmins can inspect changes in website files and revert them if needed
- easy to integrate within other mechanism


Requirements
-------------

* GIT
* apache-mpm-itk - multiuser MPM for Apache
* makepasswd - passsword generator
