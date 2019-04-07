source $_ROELLSH_DIR/core/includes/colors.sh


# $1 is your function to execute
# $2 optional Text

function areYouSure()
{
    defaultText="${YELLOW} Are you sure you want to execute '$1' enter: [y,n] ${SET}";
    local choice
    if [ -n "$2" ]; then
        echo $2
        read choice;
        else
        echo $defaultText;
        read choice;
    fi

    case $choice in
         "y"|"Y"|"YES"|"yes"|"Yes") $1;;
        *) exit;
    esac 
}
