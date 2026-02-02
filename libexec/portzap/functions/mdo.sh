#!/bin/sh
set -e

get_system_rules()
{
    sysctl -n security.mac.do.rules 2> /dev/null || true
}

merge_rules()
{
    local lh
    local rh
    lh=$1
    rh=$2
    printf "%s\n%s\n" "${lh}" "${rh}" | \
        tr ';' '\n' | \
        awk 'NF' | \
        awk '!seen[$0]++' | \
        paste -sd ';' -
}

filter_rules()
{
    local system_rules portzap_rules
    system_rules=$1
    portzap_rules=$2
    printf "%s" "${system_rules}" | tr ';' '\n' | awk -v rulez="${portzap_rules}" '
BEGIN { n = split(rulez, r, "\n") }
NF {
    for (i = 1; i <= n; i++) if ($0 == r[i]) next
    print
}
'
}

join_rules()
{
    local rule_list
    rule_list=$1
    printf "%s" "${rule_list}" | paste -sd ';' -
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
