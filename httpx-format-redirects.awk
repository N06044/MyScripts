# How to use: httpx -l {subdomains.txt} -sc -cl -ct -title -mc 200 -fr | awk -f ~/MyScripts/httpx-format-redirects.awk | sort

# What it does: Filters for redirects that eventually end in 200 and changes output to a more readable format

!/\[\033\[32m200\033\[0m\]/ {

    match($NF, /https?:\/\/[^\/]*/);

    URL=substr($NF, RSTART, RLENGTH); $NF="";

    for (i=5; i<NF; i++) { printf "%s ", $i };

    print "[\033[38;5;198m"URL"\033[0m]", $4, $3, $1;

    }