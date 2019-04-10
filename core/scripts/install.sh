# Colors
LIGHTRED='\033[1;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
SET='\033[0m'

# Global vars
aliasPath="";
installPath=~/rsh;
rsh=$installPath/rsh.sh;

function checkBashDirs() 
{
    bash=~/.bashrc
    bash_profile=~/.bashrc_profile
    if [ -f $bash ]; then
        aliasPath=$bash;
    elif [ -f $bash_profile]; then
        aliasPath=$bash_profile;
    else
        touch $bash;
        aliasPath=$bash;
    fi
}

function printHeader()
{
cat << "EOF"

   ___  ____  ______   __     ______ __
  / _ \/ __ \/ __/ /  / /    / __/ // /
 / , _/ /_/ / _// /__/ /__  _\ \/ _  / 
/_/|_|\____/___/____/____/ /___/_//_/                                                                            

EOF
}

function setAlias() 
{
    grep -q -F "$rsh" $aliasPath || echo source $rsh >> $aliasPath
}

function installRsh() 
{
    mkdir -p $installPath;
    cd $installPath;
    rm -rf *;
    echo "download and install..."
    curl -LkSs https://github.com/maxiroellplenty/roellsh/archive/master.zip -o rsh.tar.gz
    tar -xzf rsh.tar.gz && cp -r roellsh-master/* ./
    rm -rf roellsh-master && rm -rf rsh.tar.gz
    echo "Done files downloaded to: ${GREEN} $installPath ${SET}"
}

function areYouSure()
{
    defaultText="${YELLOW}Are you sure you want to install roellsh enter: [y,n] ${SET}";
    echo $defaultText;
    read choice;

    case $choice in
         "y"|"Y"|"YES"|"yes"|"Yes") $1;;
        *) exit;
    esac 
}

echo "${LIGHTRED}"
printHeader;
echo "${SET}"
areYouSure;

if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
   aliasPath=~/.zshrc;
elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
    aliasPath;
else
   echo "${LIGHTRED}No bash or zsh shell detected to access alias file${SET}";
fi

echo "Set alias path to:${GREEN} $aliasPath ${SET}";
echo "Set install path to: ${GREEN} $installPath ${SET}";
installRsh;
setAlias;
echo "Open new shell and type 'rsh' to start the script";

