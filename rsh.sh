# Version
export VERSION="1.0"

# Global Vars
export _ROELLSH_DIR="~/rsh";
export _PLUGINS_DIR="$_ROELLSH_DIR/plugins";

# Source all Plugins
for f in `ls $_PLUGINS_DIR`; do source $_PLUGINS_DIR/$f; done;

# Source core files
source $_ROELLSH_DIR/core/core.sh

function rsh()
{
    # Show menu when there is no first param
    if [ -z "$1" ]; then
        sh $_ROELLSH_DIR/core/menu/menu.sh;
    fi

    if [ "$1" = "help" ]; then
        _help;
        return 1;
    fi

    # Get pugin name to pase the function to
    local pluginName=""
    if [ -n "$1" ]; then
        pluginName=$1;
    fi
    local param=""
    if [ -n "$2" ]; then
        param=$2;
    fi
    local secondParam=""
    if [ -n "$3" ]; then
        secondParam=$3;
    fi
    if [ -n "$1" ]; then 
        sh $_PLUGINS_DIR/$pluginName.sh $param $secondParam;
    fi
}

