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

``` bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/maxiroellplenty/roellsh/master/core/scripts/install.sh)"
```

## Demo
![demo](demo.gif)
