set -e
echo "New name=$1" >> ~/out.log
if [ "$#" -lt 3 ]; then
  NUM=`i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num'`
  NUM_ID=$NUM;
  if [ "$NUM" -gt 10 ]; then
    NUM_ID=$((${NUM} -10))
    NUM_ID=`echo $NUM_ID | tr '0-7' '0A-G'`
  fi
else
  NUM=$2
fi
NAME="\"$NUM_ID: $1\""
set_workspace_name.sh $NUM "$NAME"

# Only do the actual renaming if the number wasn't set:
if [ "$#" -lt 3 ]; then
  i3-msg "rename workspace to $NAME"
fi
