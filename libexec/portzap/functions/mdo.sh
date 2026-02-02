#!/bin/sh
set -e

get_system_rules()
{
    sysctl -n security.mac.do.rules 2> /dev/null || true
}

get_portzap_rules()
{
    local libexec
    libexec=$1
    "${libexec}"/scripts/get-mdo-rule | tr ';' '\n' | sed '/^$/d'
}

is_rule_enabled()
{
    local system_rules rule_list syslist entry
    system_rules=$1
    rule_list=$2

    syslist=$(printf "%s" "${system_rules}" | tr ';' '\n')
    while IFS= read -r entry; do
        [ -z "${entry}" ] && continue
        printf "%s\n" "${syslist}" | grep -Fxq -- "${entry}" || return 1
    done <<EOFRULES
${rule_list}
EOFRULES
    return 0
}
