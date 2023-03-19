##
# Returns true when current user is in _portzap group
has_portzap_access() {
    groups=$(id -Gn)
    in_group=1
    for g in $groups; do
        if [ $g = "_portzap" ];
        then
            in_group=0
        fi
    done
    return $in_group
}

##
# Returns true when current user is root
user_is_not_root() {
    user_id=$(id -u)
    result=$(test $user_id -ne "0")
    return $result
}
