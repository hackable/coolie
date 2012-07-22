#!/bin/bash

source ./config

# declare directory variable
COMMAND=$1

function sync_local() {
  

echo "SYNC START - Remote files with local" 

rsync -avz -e "ssh -i $SSH_KEY" $SSH_USER@$SSH_HOST:$REMOTE_DIR* $LOCAL_DIR --progress --delete 

echo "SYNC END"

}


function sync_remote() {
  

echo "SYNC START - Local files with Remote" 

rsync -avz $LOCAL_DIR* -e  "ssh -i $SSH_KEY" $SSH_USER@$SSH_HOST:$REMOTE_DIR --progress --delete

echo "SYNC END"

}


case $COMMAND in
--local)
   sync_local
   ;;
--remote)
   sync_remote
   ;;
--version)
   echo "Coolie:" $VERSION
   ;;
*)
   echo "No option is not recognized"
   ;;
esac
