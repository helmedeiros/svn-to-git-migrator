#!/bin/bash

PROJECT_OWNER=$1
PROJECT_NAME=$2
url="https://github.com"

if [ "$PROJECT_OWNER" == "" ] || [ "$PROJECT_NAME" == "" ]; then
        echo "Usage: $0 [project_owner] [project_name]"
        echo "Example: $0 \"helmedeiros\" \"svn-to-git-migrator\""
        exit 1
fi

echo "Ok, starting migrating the project $PROJECT_NAME by $PROJECT_OWNER"

echo "OK, give me your SVN user."
read USER

if [ "$USER" == "" ]; then
        echo -e "\e[31mIm sorry, but I will need a user."
        echo -e "\e[39m"
        exit;
fi

echo "Transforming from SVN $url/$PROJECT_OWNER/$PROJECT_NAME project to GIT"

echo "Getting from SVN $url/$PROJECT_OWNER/$PROJECT_NAME"
git svn clone --username $USER $url/$PROJECT_OWNER/ $PROJECT_NAME
