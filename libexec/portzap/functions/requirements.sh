require_deps() {
    deps=$1
    for dep in $deps; do
        which -s $dep
        if [ $? -ne 0 ]; then
            echo $dep is required, but not found
            exit 1
        fi
    done
}

require_group() {
    group=$1
    cmd=$(id -Gn | tr ' ' '\n' | grep "^${group}$")
    if [ "$cmd" != "$group" ]; then
        echo "You must be a member of the '$group' group to run this command."
        exit 1
    fi
}

require_root() {
    if [ "$(id -u)" != "0" ]; then
        echo "The install command must be run as root."
        exit 1
    fi
}
