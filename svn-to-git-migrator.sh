#!/usr/bin/env bash
#
#Extracts svn projects to a Git repository.
#
#Main script to manage input options.
source $(dirname $0)/commands.sh

# Execute getopt
ARGS=$(getopt -o u:T:t:n -l "username:,trunk:,tags:,nobranches" -n "getopt.sh" -- "$@");

#Bad arguments
if [ $? -ne 0 ];
then
  exit 1
fi

eval set -- "$ARGS";

# Parse user options
while true; do
  case "$1" in

  	# describing the tags repository layout
    -n|--nobranches)
      shift;
      if [ -n "$1" ]; then
        cmd_branch "";
        shift;
	  fi
      ;;
  	# describing the tags repository layout
    -t|--tags)
      shift;
      if [ -n "$1" ]; then
        cmd_tags $1;
        shift;
      else
		cmd_die "the tag name wasn't valid ${1}."
	  fi
      ;;
  	# describing the trunk repository layout
    -T|--trunk)
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

PROJECT_NAME=`expr $URL : '[a-z].*/\([a-z0-9].*\)'`;

run_cmd "mkdir $PROJECT_NAME";
run_cmd "cd $PROJECT_NAME";

run_cmd "git svn init --prefix=svn/ $cmd_complement $URL";
run_cmd "git svn fetch"