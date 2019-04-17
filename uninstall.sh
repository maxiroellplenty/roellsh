function areYouSure()
{
    defaultText="${YELLOW}Are you sure you want to uninstall roellsh enter: [y,n] ${SET}";
    echo $defaultText;
    read choice;

    case $choice in
         "y"|"Y"|"YES"|"yes"|"Yes") $1;;
        *) exit;
    esac 
}
areYouSure
rm -rf ~/rsh