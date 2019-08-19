set -e
if [ "$#" -lt 2 ]; then
  NAME="\"$1\""
else
  NAME="$2"
fi
echo $NAME > ~/.config/i3/workspace_$1.txt
