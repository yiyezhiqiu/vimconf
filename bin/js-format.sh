# awk command is to strip extra newline inserted by esformatter
esformatter --config ~/.vim/lib/js-config.json | awk -v n=1 'NR>n{print a[NR%n]}{a[NR%n]=$0}'

