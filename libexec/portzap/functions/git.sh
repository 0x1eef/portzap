##
# Returns a list of new, and modified files between two points / commits.
modified_ports() {
    rev=$1
    files=$(git diff --name-only --diff-filter=AM $rev..HEAD)
    for file in $files; do
        dirs="$dirs $(port_dirname $file)"
    done
    dirs=$(echo $dirs | tr ' ' '\n' | uniq)
    echo $dirs
}
