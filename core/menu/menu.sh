#!/bin/sh

source $_ROELLSH_DIR/core/includes/art.sh
source $_ROELLSH_DIR/core/includes/colors.sh

function printLine()
{
    printf "%0.s-" {1..44};
    echo "";
}
function printMenu()
{
   local count=1;
    for f in `ls $_PLUGINS_DIR`; do 
        name=${f/'.sh'}
        echo $count $name;
        let "count=count+1"; 
    done;
}
echo "${PURPLE}"
printHeader;
echo "${SET}"
printLine;
echo "${BLUE}Installed plugins:${SET}"
printMenu;
printLine;
echo "help for roellsh: ${BLUE} rsh help${SET}"
echo "help for plugin: ${BLUE}  rsh pluginName help${SET}"
printLine;
