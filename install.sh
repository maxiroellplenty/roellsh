# Colors
LIGHTRED='\033[1;31m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
SET='\033[0m'

# Global vars
aliasPath="";
installPath=~/rsh;
rsh=$installPath/rsh.sh;

function checkBashDirs
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

function printHeader
{
cat << "EOF"
                          ,     \    /      ,
                         / \    )\__/(     / \
                        /   \  (_\  /_)   /   \
     __________________/_____\__\@  @/___/_____\_________________
     |                          |\../|                          |
     |                           \VV/                           |
     |                                                          |
     |               welcome to roellsh installer               |
     |                          -----                           |
     |                     by Frank Wizard                      |
     |                                                          |
     |__________________________________________________________|
                   |    /\ /      \\       \ /\    |
                   |  /   V        ))       V   \  |
                   |/     `       //        '     \|
                   `              V                '
                                                              
EOF
#img by Brian Young
#This ASCII pic can be found at
#https://asciiart.website/index.php?art=creatures/dragons

}

function setAlias
{
    grep -q -F "$rsh" $aliasPath || echo source $rsh >> $aliasPath
}

function installRsh
{
    mkdir -pv $installPath;
    #cd $installPath;
    #rm -rf *;
    echo "Copy files to: ${GREEN} $installPath ${SET}"
    cp -r ./* $installPath; 
}

function areYouSure
{
    defaultText="${YELLOW}Are you sure you want to install roellsh enter: [y,n]${SET}";
    if [ -n "$1" ]; then
        defaultText="$1";
    fi
    echo "$defaultText";
    read choice;
    case $choice in
         "y"|"Y"|"YES"|"yes"|"Yes");;
        *) exit;
    esac 
}

echo "${RED}"
printHeader;
echo "${SET}"
areYouSure;
if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
   aliasPath=~/.zshrc;
elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
    checkBashDirs;
else
   echo "${LIGHTRED}No bash or zsh shell detected to access alias file${SET}";
fi

if [ -d "$installPath" ]; then
    areYouSure "directory ${LIGHTRED}$installPath${SET} does already exist do you want to ${LIGHTRED}o${SET}verwrite or ${YELLOW}a${SET}bord. [${LIGHTRED}y${SET},${YELLOW}n${SET}]";
fi


echo "Writing alias to:${GREEN} $aliasPath ${SET}";
echo "Set install path to: ${GREEN} $installPath ${SET}";
installRsh;
setAlias;
echo "Thats it. Open new shell and type 'rsh' to start the script";
echo ""
areYouSure "do you want to remove the downloaded files at ${GREEN}$(pwd)${SET} enter: [y,n]";
cd ..
if [ -d "roellsh" ]; then
    rm -rf "roellsh";
fi


