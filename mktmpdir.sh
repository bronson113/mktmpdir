#!/bin/bash



usage () {
    echo "Usage: $0 [-p] [-n NAME]" 2>&1
}

TMP_DIR_NAME="temp"
PERSIST=0
OPTIND=1

# parse the arguments
while getopts "n:p" options; 
do
    case $options in
        p)
            # persist mode, don't delete on exit
            PERSIST=1
            ;;
        n)
            # name the command prompt :)
            TMP_DIR_NAME=$OPTARG
            ;;
        :)
            # requires arguments
            echo "option -$OPTARG requires an argument"
            usage 
            exit 1
            ;;
        *)
            echo "unexpected option: $1"
            usage
            exit 1
            ;;
    esac
done


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
if (( PERSIST == 1 ));
then
    PS1="($TMP_DIR_NAME-PERSIST) ${SAVED_PS1:-}"
else
    PS1="($TMP_DIR_NAME) ${SAVED_PS1:-}"
fi
export PS1

# add a persist function so you can change your mind mid way
# typing persist will flip the persist status
function persist {
    if (( PERSIST == 1 ));
    then
        PS1="($TMP_DIR_NAME) ${SAVED_PS1:-}"
        PERSIST=0;
    else
        PS1="($TMP_DIR_NAME-PERSIST) ${SAVED_PS1:-}"
        PERSIST=1;
    fi
}


# hook the exit
function exit {
    if (( PERSIST != 1 ));
    then
        rm -rf "$TEMP_DIR"
        echo "Deleted temporary working directory $TEMP_DIR"
    fi
    PS1=${SAVED_PS1:-}
    cd $SAVE_PWD
    unset -f exit
}

trap exit exit
