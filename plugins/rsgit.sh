# Settings
source $_ROELLSH_DIR/core/helper/helper-functions.sh
# Global Vars
_WORKSPACE_DIR="/workspace/";
# Add your Git repositories
declare -a repositories=();
repositories=("terra" "terra-components")

#Pull Repos
function pull()
{
    for repo in "${repositories[@]}"
    do
        dir="$_WORKSPACE_DIR$repo"
        cd $dir;
        echo "Pulling: ${BLUE}$(basename `pwd`)${SET}"
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

# clear roellsh stash for repository
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
        git pull
    else
        git pull
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

function sclear() 
{
    echo "clear";
}


function _help() 
{
cat << "EOF"
    rsgit.sh 
    
    usage:
    
    pull    tries to pull al your linked repositories to the latest version
            if there are changes the command will stash them.

    repos   will list your linked repositories and show their branch    
   
    stash   is a git function to stash your changes with
            example: --stash yourStashName
    
    clear   will delete all created stashes from roellsh

EOF
}

if [ -n "$1" ]; then
   case $1 in
       "pull") pull;;
       "stash") stash $2;;
       "repos") repos;;
       "sclear") areYouSure clear;;
       "help") _help;;
       *) _help;;
   esac
fi


