#!/usr/bin/env bash
#
#Extracts svn projects to a Git repository.
#
#Main script to manage input options.
source $(dirname $0)/commands.sh

# Execute getopt
ARGS=$(getopt -o u:t: -l "username:,trunk:" -n "getopt.sh" -- "$@");

#Bad arguments
if [ $? -ne 0 ];
then
  exit 1
fi

eval set -- "$ARGS";

# Parse user options
while true; do
  case "$1" in

  	# describing the trunk repository layout
    -t|--trunk)
      shift;
      if [ -n "$1" ]; then
        cmd_trunk $1;
        shift;
      else
		cmd_die "the trunk name wasn't valid ${1}."
	  fi
      ;;
  	# Set username to connect to svn
    -u|--username)
      shift;
      if [ -n "$1" ]; then
        cmd_username $1;
        shift;
      else
		cmd_die "the username wasn't valid ${1}."
	  fi
      ;;
    --)
      shift;
      break;
      ;;
  esac
done

URL=$@

if [ "$URL" == "" ]; then
        echo "Usage: $0 [project_url]"
        echo "Example: $0 \"https://svn.example.com/path/to/repo\""
        exit 1
fi

echo "Ok, starting migrating the project from $URL"

echo "Getting from SVN $URL"

git svn clone $URL $cmd_complement