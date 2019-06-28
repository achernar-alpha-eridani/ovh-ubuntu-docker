#!/bin/sh

# This is the Achernar OVH initialization script!
#
# Are you looking at this in your web browser, and would like to setup a new Achernar OVH machine?
#
# On the OVH Linux machine:
#   Just open up your terminal and type:
#
#     curl https://install.achernar.me/ | sh
#
#   Achernar OVH initialization script will install and configure:
#    - Docker CE

# We wrap this whole script in a function, so that we won't execute
# until the entire script is downloaded.
# That's good because it prevents our output overlapping with curl's.
# It also means that we can't run a partially downloaded script.
# We don't indent because it would be really confusing with the heredocs.
run_it () {

# This always does a clean installation of latest version of
# Docker CE into your OVH machine

RELEASE="1.0.0"


# Now, on to the actual script!

## NOTE sh NOT bash. This script should be POSIX sh only, since we don't
## know what shell the user has. Debian uses 'dash' for 'sh', for
## example.

set -e
set -u

# Let's display everything on stderr.
exec 1>&2

OS=$(lsb_release -si | tr [:upper:] [:lower:])
# Check to see if it is ubuntu.
if [ "$OS" != "ubuntu" ] ; then
    echo "Sorry, this OS $OS is not supported yet via this installer."
    exit 1
fi

sudo apt update
sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common git -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce -y
sudo systemctl status docker

trap - EXIT
}

run_it
