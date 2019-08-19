set -e
echo "New name=$1" >> ~/out.log
if [ "$#" -lt 3 ]; then
  NUM=`i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num'`
else
  NUM=$2
fi
NAME="\"$NUM: $1\""
set_workspace_name.sh $NUM "$NAME"

# Only do the actual renaming if the number wasn't set:
if [ "$#" -lt 3 ]; then
  i3-msg "rename workspace to $NAME"
fi
