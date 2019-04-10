_VAGRANT_DIR="/workspace/vagrant-vm"

function _help()
{
    cd $_VAGRANT_DIR && vagrant --help
}
if [ "$1" = "help" ]; then
    _help;
fi

if [ -n "$1" ]; then
    cd $_VAGRANT_DIR && vagrant $1
fi