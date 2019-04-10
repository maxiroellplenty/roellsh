_VAGRANT_DIR="/workspace/vagrant-vm"

function _help()
{
    cat << "EOF"
    ceres.sh 
    
    usage:
    
    install     installVM

    build-dep   builds dependencies

    build-set   builds plugin set

EOF
}

function sshToVagrant() 
{
    cd $_VAGRANT_DIR;
    vagrant ssh -c "$1";
}



if [ -n "$1" ]; then
    case "$1" in
        "build") sshToVagrant;;
        "install") sshToVagrant "installVM";;
        "help") _help;;
        *) _help;;
    esac
fi