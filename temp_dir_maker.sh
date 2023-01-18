cd /tmp
TEMP_DIR="temp_dir_$(echo $RANDOM | md5sum | head -c 16)"
echo $TEMP_DIR
mkdir $TEMP_DIR
cd $TEMP_DIR
bash


