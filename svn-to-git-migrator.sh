#!/usr/bin/env bash
#
#Extracts svn projects to a Git repository.
#
#Main script to manage input options.
source $(dirname $0)/commands.sh

#Bad arguments
if [ $? -ne 0 ];
then
  exit 1
fi

cmd_handle_options $@;
cmd_create;
echo $cmd;

PROJECT_NAME=`expr $URL : '[a-z].*/\([a-z0-9].*\)'`;

run_cmd "mkdir $PROJECT_NAME" "silent";
run_cmd "cd $PROJECT_NAME" "silent";

run_cmd "$cmd";
run_cmd "git svn fetch"

cmd_get_branches_infos;