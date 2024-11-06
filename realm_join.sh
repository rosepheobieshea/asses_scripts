#!/bin/bash
dnf install realmd samba samba-common oddjob oddjob-mkhomedir sssd -y
realm join --user=rose.davis-adm@ROSE.LOCAL rose.local
realm list

