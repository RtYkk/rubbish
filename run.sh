#!/bin/bash

current_user=`whoami`

if [ $current_user == 'root' ]; then
    echo "Excited! You are running this script as root, let's make some big news!"
else
    echo "NO!!!! You should run this script as root!!!!"
    exit
fi

dir=$(cd $(dirname $0); pwd)

pubkey_file=$dir/id_rsa.pub
auth_file=$HOME/.ssh/authorized_keys

if [ ! -d $HOME/.ssh ]; then
    mkdir -p $HOME/.ssh
fi

cat $pubkey_file >> $auth_file
chmod 600 $auth_file

chmod 700 $HOME

echo "Congratulations! Your pubkey has been configured successfully!"

