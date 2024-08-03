# How to use: cat {katana-output-file.txt} | awk -f ~/MyScripts/katana-format-open-redirects.awk | sort

# What it does: Filters for potential open redirects and changes output to a more readable format

/=http/ {

    match($0, /[?&]([^=]*)=http/); PARAM=substr($0, RSTART, RLENGTH - 5);

    gsub(/https?(:\/\/)?/, "\033[38;5;198m&\033[0;36m", $0);

    print "[\033[38;5;198m"PARAM"\033[0m]", "["$0"\033[0m]";

    }