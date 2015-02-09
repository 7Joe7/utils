#!/bin/sh

ssh -t remotehost "sudo "

function pause(){
   read -p "$*"
}

pause 'Press [Enter] key to continue...'
sudo gem install bundler --no-ri --no-rdoc
pause 'Press [Enter] key to continue...'