#!/usr/bin/env bash
#
function handle_args(){
  # Execute getopt
  ARGS=$(getopt -o u:T:t:nd -l "username:,trunk:,tags:,nobranches,dontrun" -n "getopt.sh" -- "$@");

  eval set -- "$ARGS";

  # Parse user options
  while true; do
    case "$1" in

      # describing the tags repository layout
      -n|--nobranches)
        cmd_branch "";
        shift;        
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
      -d|--dontrun)
        shift;
        execute='0';
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
}