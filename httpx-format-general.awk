# How to use: httpx -l {subdomains.txt} -sc -cl -ct -title -mc 200 | awk -f ~/MyScripts/httpx-format-general.txt | sort

# What it does: Changes output to a more readable format

{
    for (i=5; i<=NF; i++) { printf "%s ", $i };

    print $4, $3, $2, $1
}