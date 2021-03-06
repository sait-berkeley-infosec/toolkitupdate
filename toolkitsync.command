#!/bin/bash

if [ $# -ne 1 ] ; then
	echo "Using default toolkit location... (/media/TOOLKIT/)"
        TOOLKIT=/Volumes/TOOLKIT/
else
        TOOLKIT=$1
fi

# Author Daniel Smith <dsmith@rescomp.berkeley.edu>
# Edited 2013-09-05 by Samuel Zhu <sjzhu@rescomp.berkeley.edu>
# Provides a nice and easy way for RCCs to sync their toolkits to
# the latest version -- should take only two clicks
#TODO: set this for OS X client
TOOLKITSOURCE=/export/teams/rcc/TOOLKIT/
CHECK_MOUNT=`mount | grep -i toolkit | cut --complement -d" " -f1-2`
CHECK_MOUNT_WORDS=`echo $CHECK_MOUNT | wc -w`
TOOLKIT_FOLDER=${TOOLKIT}/RCC\ Toolkit
TOOLKIT_DEV=`mount | grep -i toolkit | cut -d" " -f1`

# These are in place because current (as of 2010-11-22) RCC toolkits
# also include a separate Ubuntu partition. I have no comment on the
# matter here except that it makes for a bit of a kludge
UBUNTU_DEV=`mount | grep -i ubuntu | cut -d" " -f1`

#TODO: set this for OS X client
# ADD ME
LOG_FOLDER=/export/teams/rcc/toolkit_logs

function usage()
{
    echo $0
    echo
    echo "Performs an rsync between an RCC toolkit and the master, up-"
    echo "to-date toolkit stored at /export/teams/rcc/toolkit."
    echo
    echo "Assumes: toolkit is mounted at /media/TOOLKIT (as is the"
    echo "case if the end user is using gnome-volume-manager and the"
    echo "toolkit does bear the volume name TOOLKIT)"
    echo
    echo "NOTE: this script does NOT delete excess files on a toolkit."
    echo "If for some reason you would like your toolkit to be wiped,"
    echo "you can use the command shred to do so, or ask a sysadmin. That"
    echo "feature may be included in future releases."
    echo
}

# Actually pulls files from the source image onto the drive, if
# necessary; this is the big part of the script
function sync()
{
    echo "Syncing drive..."
    rsync -rlvuzh --progress --stats "$TOOLKITSOURCE" "$TOOLKIT_FOLDER"
    # Okay, just to explain the flags here, so people know what's
    # up:
    # -r recursive
    # -l copy symlinks as symlinks
    # -v verbose (hey why not?)
    # -u update; skips files that are newer on receiver (toolkit)
    # -z compress data during transfer; in the worst case this is a
    # 3 gig transfer or something like that, so why not
    # -h human readable
    # --progress does what you think
    # --stats also does what you think
}

# Unmounts the drive; this is just a convenience thing since
# apparently CentOS doesn't play nice with drives forcibly removed
# (and people don't play nice with unmounting drives manually)
function unmount()
{
    echo "Trying to unmount toolkit"
    umount $TOOLKIT
    if [[ $? -ne 0 ]]; then
        echo "UH OH! There was an error unmounting the toolkit."
        echo "Please make sure to manually unmount the toolkit after"
        echo "this script exits"
        echo "Press ENTER to continue..."
        read response;
        exit 1
    fi
    if [[ -b $UBUNTU_DEV ]]; then
        umount $UBUNTU_DEV
    fi
}

# Prepares a toolkit for syncing; it is possible that an RCC has
# used their toolkit since the last time they were in the office
# (ideally his or her last helpdesk shift) and modified some files
# on it, so we touch all files on the drive so that they are dated
# as of 8 days ago, just for good measure

# THIS IS UNNECESSARY; it is here only as a formality and may be
# used in future versions
function prep()
{
    echo "Preparing toolkit for update..."
    find ${TOOLKIT} | xargs touch --date="8 days ago"
}

# ADD ME (the entire function)
function log()
{
    echo $(date "+%Y-%m-%d %H:%M") $(whoami) >> ${LOG_FOLDER}$(date "+%Y-%m")
}

if [[ ! -r $TOOLKITSOURCE ]]; then
    echo "Error: cannot read sync directory. Exiting."
    echo "Press ENTER to exit."
    read response
    exit 1
fi
if [[ ! -w $TOOLKIT ]]; then
    echo "Error: cannot write to toolkit! Exiting."
    echo "Press ENTER to exit."
    read response
    exit 2
fi
if [[ ! -e $TOOLKIT_FOLDER ]]; then
    echo "Warning: RCC Toolkit folder does not exist on $TOOLKIT_DEV."
    echo "I'm going to make it for you, hope you don't mind..."
    mkdir "$TOOLKIT_FOLDER"
fi
if [[ ! -w $TOOLKIT_FOLDER ]]; then
    echo "Error: cannot write to toolkit directory! Check your permissions!"
    echo "Press ENTER to exit."
    read response
    exit 2
fi
sync
unmount
# ADD ME
log
touch ~/.toolkitsync
echo "Should be good to go. Exiting."
echo "Press ENTER to exit."
read response
exit 0
#vim:ft=bash
