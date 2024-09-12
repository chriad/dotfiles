#!/usr/bin/env bash


# quodlibet-rate-up.bash <(m3u--files test.m3u)
# cat test.m3u | paste -sd",\n"
# tail --lines +2 "${1}" | paste -sd",\n"
# grep -v "^#" tmp.m3u 2>&1 | sed 's|Podcasts/||g'

# x="$(io.github.quodlibet.QuodLibet --print-query=~filename="${1}")"
# y=$(tail --lines +2 "${1}" | paste -sd"\t\n")
# echo $y

while read -r fname; do
    x="$(io.github.quodlibet.QuodLibet --print-query=~filename=/"$fname"/)"
    if [[ -n "$x" ]] && [[ `echo "$x" | wc -l` -eq 1 ]] ; then
        io.github.quodlibet.QuodLibet  --enqueue="${x}"
        # io.github.quodlibet.QuodLibet --play-file=/"$x"/ \
        # io.github.quodlibet.QuodLibet --rating-up \
        # sleep 2
        # io.github.quodlibet.QuodLibet --next
       # echo "$x"
       # echo
    else
        echo "[Fail] $fname"
    fi
# done < <($y)
done < "${1}"
