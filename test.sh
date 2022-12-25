#!/usr/bin/bash

BASE_URL="https://peipeipe.github.io/www-de-tsukamaete-stg.github.io/"
TWEET_MESSAGE=""
LATEST=0

DIFF_FILES=`git diff HEAD^..HEAD --name-only --diff-filter=A -- _posts/*.md`

for FILE_PATH in $DIFF_FILES ; do
  TITLE=`head -13 ${FILE_PATH} | grep '^title:' | sed 's/^title: *//g'`
  DESCRIPTION=`head -13 ${FILE_PATH} | grep '^description:' | sed 's/^description: *//g'`
  EPISODE_NUM=`head ${FILE_PATH} | grep '^audio_file_path:' | sed 's/^audio_file_path: *//g'| cut -c 8-10`

  DESCRIPTION_SHORT=`head -13 ${FILE_PATH} | grep '^description:' | sed 's/^description: *//g'`

  MESSAGE="${TITLE} ${BASE_URL}/episode/${EPISODE_NUM} #wtsuka\n ${DESCRIPTION}"


TWEET_MESSAGE="【更新】${MESSAGE}"



done
# echo ${TWEET_MESSAGE}

length=$(echo -n $MESSAGE | wc -m)

if [  $length -gt 180 ]; then
  echo ${TWEET_MESSAGE} 
else
  echo ${TWEET_MESSAGE} 
fi