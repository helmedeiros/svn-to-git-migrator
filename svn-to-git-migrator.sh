#!/bin/bash

URL=$1

if [ "$URL" == "" ]; then
        echo "Usage: $0 [project_url]"
        echo "Example: $0 \"https://svn.example.com/path/to/repo\""
        exit 1
fi

echo "Ok, starting migrating the project from $URL"

echo "Getting from SVN $url"
git svn clone $url