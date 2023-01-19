# mktmpdir
Create a temperary directory so you can test stuff without worrying where to store it


## Usage

To create a temperary directory and spawn a shell in it, run
```bash
source ./mktmpdir.sh
```

To export the script as a command, do the following:
```bash
echo "alias mktmpdir=\"source $(PWD)/mktmpdir.sh\"" >> .bashrc
source ~/.bashrc
```

