# Settings
source $_ROELLSH_DIR/core/helper/helper-functions.sh
# Global Vars
_WORKSPACE_DIR="/workspace/";
# Add your Git repositories
declare -a repositories=();
repositories=("terra" "terra-components" "pl" "py" "ps")

#Pull Repos
function pull()
{
    for repo in "${repositories[@]}"
    do
        dir="$_WORKSPACE_DIR$repo"
        cd $dir;
        echo "Pulling: ${BLUE}$(basename `pwd`)${SET} | ${PURPLE}$(getCurrentBranch)${SET}"
        savePull;
    done;
}

# List Repos 
function repos() 
{
    for repo in "${repositories[@]}"
    do
        dir="$_WORKSPACE_DIR$repo"
        cd $dir;
        if [ -n "$(git status --porcelain)" ]; then
             changes="${GREEN}+${SET}${RED}-${SET}"
        fi
        echo "$(basename `pwd`) ${bold}=> ${normal} ${PURPLE}$(getCurrentBranch)${SET} $changes"
    done
    echo ""
}

# Stash
function stash()
{
    git stash save "$1"
}


function minto()
{
    local mergeIntoCurrentBranch;
    local myCurrentBranch;
    if [ -n "$1" ]; then
        mergeIntoCurrentBranch=$1;
        else
        echo "error TODO"
        return 1;
    fi
    myCurrentBranch=$(getCurrentBranch);
    saveStash;
    git checkout $mergeIntoCurrentBranch;
    git pull;
    git checkout $myCurrentBranch;
    git merge $mergeIntoCurrentBranch;
    git status;
}

function savePull()
{
    if [ -n "$(git status --porcelain)" ]; then
        saveStash;
        git pull &> /dev/null
        echo "${GREEN} ✔️ ${SET} done"
    else
        git pull &> /dev/null
        echo "${GREEN} ✔️ ${SET} done"
    fi
}

function saveStash()
{
    name="roellsh_$(getCurrentBranch)_$(date +%F)_$(date +%T)";
    stash $name;
}

function getCurrentBranch()
{
    branch=`git branch | grep \* | cut -d ' ' -f2`
    echo $branch;
}
# clear roellsh stash for repository
function sclear() 
{
    echo "TODO";
}

function art() 
{
cat << "EOF"
__________  _________   ________.______________    
\______   \/   _____/  /  _____/|   \__    ___/
 |       _/\_____  \  /   \  ___|   | |    |   
 |    |   \/        \ \    \_\  \   | |    |   
 |____|_  /_______  /  \______  /___| |____|   
        \/        \/          \/          
by Frank Wizard     
EOF
}
function _help() 
{
cat << "EOF"
    rsgit.sh 
    
    usage:

    menu    will start the plugin in menu mode for easy use
    
    pull    tries to pull all your linked repositories to the latest version
            if there are changes the command will stash them.

    repos   will list your linked repositories and show their branch    
   
    stash   is a git function to stash your changes with
            example: rsh rsgit stash yourStashName
    
    sclear  will delete all created stashes from roellsh

EOF
}

function menu() 
{
    art;
    printf "%0.s-" {1..47};
    echo ""
    echo "| 1. pull repos"
    echo "| 2. list repos"
    echo "| 3. clear rsh stash"
    echo "| 4. help"
    echo "| 5. exit"
    printf "%0.s-" {1..47};
    echo ""
    echo "Enter option: "
    local choice;
    read choice;
    case $choice in
       "1") pull;;
       "2") repos;;
       "3") areYouSure clear;;
       "4") _help;;
       "5") exit 0;;
       *) menu;;
   esac
   menu;
}

if [ -n "$1" ]; then
   case $1 in
       "menu") menu;; 
       "pull") pull;;
       "stash") stash $2;;
       "repos") repos;;
       "sclear") areYouSure clear;;
       "help") _help;;
       *) _help;;
   esac
fi



