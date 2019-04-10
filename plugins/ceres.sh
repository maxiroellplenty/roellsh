_CERES_DIR="/workspace/localsystem/plugins/inbox/plugins/Ceres"

function _help()
{
    cat << "EOF"
    ceres.sh 
    
    usage:
    
    col     alias for `npm run collectWidgets`

    b       alias for `gulp build` 

EOF
}
if [ -n "$1" ]; then
    case "$1" in
        "b") cd $_CERES_DIR && gulp build;;
        "col") cd $_CERES_DIR && npm run collectWidgets;;
        "help") _help;;
        *) _help;;
    esac
fi