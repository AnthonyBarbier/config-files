string_replace () {
  echo "${1/WP/$2}"
}
WP=`cat ~/.config/i3/workspace_$1.txt`
#i3-msg `echo $2`
echo "foo $2 / WP $WP" > ~/out.log
sub=$(echo "$2" | sed "s/\$WP/$WP/")
echo $sub >> ~/out.log
i3-msg $sub
