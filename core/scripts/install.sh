# Colors
LIGHTRED='\033[1;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
SET='\033[0m'

# Global vars
aliasPath="";
installPath=~/rsh;

function checkBashDirs() 
{
    bash="~/.bashrc"
    bash_profile="~/.bashrc_profile"
    if [ -f $bash ]; then
        aliasPath=$bash;
    elif [ -f $bash_profile]; then
        aliasPath=$bash_profile;
    else
        touch $bash;
        aliasPath=$bash;
    fi
}

function addAlias() 
{
    echo "test"
}

function installRsh() 
{
    mkdir -p $installPath;
    cd $installPath;
    #curl -LkSs https://codeload.github.com/maxiroellplenty/update-script/legacy.zip/master -o master.tar.gz

}


if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
   aliasPath="~/.zshrc";
elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
    aliasPath;
else
   echo "${LIGHTRED}No bash or zsh shell detected to access alias file${SET}";
fi

echo "Set alias path to:${GREEN} $aliasPath ${SET}";
echo "Set install path to: ${GREEN} $installPath ${SET}";

installRsh;

# Download project 

# Add to alias list

# access rights

