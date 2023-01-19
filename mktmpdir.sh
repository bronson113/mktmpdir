#!/bin/bash

# save the current directory
SAVE_PWD=${PWD:-}

# create the temp directory
cd /tmp
echo "creating temporary directory..."
TEMP_DIR=`mktemp -d`

# enter the temporary directory
echo "entering $TEMP_DIR..."
cd $TEMP_DIR

# change the command prompt
SAVED_PS1=${PS1:-}
PS1="(temp) ${SAVED_PS1:-}"
export PS1

# hook the exit
function exit {
  rm -rf "$TEMP_DIR"
  echo "Deleted temporary working directory $TEMP_DIR"
  PS1=${SAVED_PS1:-}
  cd $SAVE_PWD
  unset -f exit
}

trap exit exit


