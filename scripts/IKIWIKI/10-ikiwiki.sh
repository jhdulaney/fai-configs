#! /bin/bash

# add a ikiwiki user account
if ! $ROOTCMD getent passwd ikiwki ; then
    $ROOTCMD adduser --system --ingroup www-data --disabled-password --gecos "ikiwiki user" ikiwiki
fi

if ! $ROOTCMD test -e /home/ikiwiki/.ssh/id_rsa; then
    $ROOTCMD echo | $ROOTCMD sudo -u ikiwiki ssh-keygen -N ''
fi

# Configure for remote use 
fcopy /home/ikiwiki/.ssh/config

# Configure git
$ROOTCMD git config --global user.name "WebUI"
$ROOMCMD git config --global user.email "ikiwiki@gluestick.office.fsf.org"
