#!/bin/bash
# @Function
# show count of tcp connection stat.
#
# @Usage
#   $ ./tcp-connection-state-counter.sh
#
# @online-doc https://github.com/oldratlee/useful-scripts/blob/master/docs/shell.md#beer-tcp-connection-state-countersh
# @author Jerry Lee (oldratlee at gmail dot com)
# @author @sunuslee (sunuslee at gmail dot com)

# On MacOS, netstat need to using -p tcp to get only tcp output.
uname | grep Darwin -q && option_for_mac="-ptcp"

netstat -tna $option_for_mac | awk 'NR > 2 {
    s[$NF]++
}

END {
    for(v in s) {
        printf "%-11s %s\n", v, s[v]
    }
}' | sort -nr -k2,2
