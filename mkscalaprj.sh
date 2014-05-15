#!/bin/sh

if [ -z $1 ]; then
  PROJECT_NAME="sbt-seed"
else
  PROJECT_NAME="$1"
fi

RND_STR=`tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1`

mkdir -p /tmp/$RND_STR

TEMP_FILENAME=/tmp/$RND_STR/$RND_STR.zip

wget -q -O $TEMP_FILENAME https://github.com/jaydeesimon/sbt-seed/archive/master.zip

CURRENT_DIR=`pwd`

cd /tmp/$RND_STR

unzip $RND_STR.zip > /dev/null

mv sbt-seed-master/ $CURRENT_DIR/$PROJECT_NAME

cd $CURRENT_DIR

echo "Created $PROJECT_NAME"
