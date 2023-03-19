#!/bin/sh

##
# Returns the depth of a path
port_depth() {
    p=$1
    result=$(echo $p | tr '/' '\n' | grep . | wc -l)
    return $result
}

##
# Returns the entry point for a port relative to /usr/ports
# (eg: ./ftp/curl/)
port_dirname() {
    p=$1
    port_depth "$p"
    depth=$?
    if [ $depth -gt 2 ]; then
        p=$(dirname $p)
        port_dirname "$p"
    else
        echo $p
    fi
}
