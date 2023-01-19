# mktmpdir
Create a temperary directory so you can test stuff without worrying where to store it

## Installation

To install the script, run the following command:
```
git clone https://github.com/bronson113/mktmpdir.git
echo "alias mktmpdir=\"source $PWD/mktmpdir.sh\"" >> .bashrc
source ~/.bashrc
```

## Usage

To create a temperary directory and spawn a shell in it, run
```bash
mktmpdir
```

You will spawn into a temperary directory like the following

```bash
~/mktmpdir$ mktmpdir
creating temparay directory...
entering /tmp/tmp.Fawdyzi3dh...
(temp) /tmp/tmp.Fawdyzi3dh$ ls
(temp) /tmp/tmp.Fawdyzi3dh$ pwd
/tmp/tmp.Fawdyzi3dh
```

To exit the environment, simpily exit
```
(temp) /tmp/tmp.Fawdyzi3dh$ exit
Deleted temp working directory /tmp/tmp.Fawdyzi3dh
~/mktmpdir$
```
You will return to the original location where you call the script from


