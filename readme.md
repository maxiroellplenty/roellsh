# roellsh 'rsh'
> make your dev life easier with rsh 100% Shell

Roellsh is a bash script which carries some useful tools for your CLI,
you can add your own plugins to add as many scripts as you want.

The main plugin is the `rsgit` plugin to pull multiple git repositories at the same time.
* edit the repos at `nano ~/rsh/plugins/rsgit` add new repos to the repositories array.

## Requirements
bash shell (Mac OS X)

## Install
install works for `zsh` and `bash`

```
git clone https://github.com/maxiroellplenty/roellsh.git
```

go into the directory roellsh
``` 
cd roellsh
```
and execute the `install.sh` file

``` 
sh install.sh
```
Follow the install script and booom type: rsh and let the magic happen.

### Linux
On Linux give the install file execution rights with (mby sudo)
```
chmod +x install.sh
```

than run
```
./install.sh
```

[LICENSE](https://github.com/maxiroellplenty/roellsh/blob/master/LICENSE)
