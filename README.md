# mktmpdir
Create a temporary directory so you can test stuff without worrying where to store it

## Installation

To install the script, run the following command:
```
git clone https://github.com/bronson113/mktmpdir.git
echo "alias mktmpdir=\"source $PWD/mktmpdir.sh\"" >> .bashrc
source ~/.bashrc
```

## Usage

To create a temporary directory and spawn a shell in it, run
```bash
mktmpdir
```

You will spawn into a temporary directory like the following

```bash
~/mktmpdir$ mktmpdir
creating temporary directory...
entering /tmp/tmp.Fawdyzi3dh...
(temp) /tmp/tmp.Fawdyzi3dh$ ls
(temp) /tmp/tmp.Fawdyzi3dh$ pwd
/tmp/tmp.Fawdyzi3dh
```

To exit the environment, simpily exit
```bash
(temp) /tmp/tmp.Fawdyzi3dh$ exit
Deleted temporary working directory /tmp/tmp.Fawdyzi3dh
~/mktmpdir$
```
You will return to the original location where you call the script from

You can name the environment by supplying it through the `-n` option
```bash
~/mktmpdir$ mktmpdir -n hello
creating temporary directory...
entering /tmp/tmp.Fawdyzi3dh...
(hello) /tmp/tmp.Fawdyzi3dh$ pwd
/tmp/tmp.Fawdyzi3dh
```

### PERSIST mode

Sometime you may want the directory to stay for a short period of time before it gets deleted.
Persist mode provides this functionality to not delete the folder upon exit the environment

To lunch a temporary environment in persist mode, type:
```bash
~/mktmpdir$ mktmpdir -p
creating temporary directory...
entering /tmp/tmp.IGb6XQNodf...
(temp-PERSIST) /tmp/tmp.IGb6XQNodf$exit
~/mktmpdir$
```

Alternatively, typed persist when you are in the environment achieve the same effect.
```bash
~/mktmpdir$ mktmpdir
creating temporary directory...
entering /tmp/tmp.etzCcIwcUk...
(temp) /tmp/tmp.etzCcIwcUk$ persist
(temp-PERSIST) /tmp/tmp.etzCcIwcUk$ exit
~/mktmpdir$
```


