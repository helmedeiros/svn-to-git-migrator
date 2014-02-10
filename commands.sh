#!/usr/bin/env bash
#
# svn-to-git-migrator commands gateway.
source $(dirname $0)/builtin/args_handler.sh
source $(dirname $0)/builtin/branch.sh
source $(dirname $0)/builtin/default_options.sh
source $(dirname $0)/builtin/die.sh
source $(dirname $0)/builtin/tag.sh
source $(dirname $0)/builtin/trunk.sh
source $(dirname $0)/builtin/username.sh

function cmd_handle_options(){
	define_default_options;
	handle_args $@;
}

function cmd_create(){
	trunk_cmd;
	tags_cmd;
	cmd="git svn init --prefix=svn/ $cmd_complement $URL";
}

function cmd_die(){
	echo "will stop";
	die $1;
}

function cmd_branch(){
	echo "defined the branch layout.";
}

function cmd_username(){
	echo "defined the username to get from svn.";
	username $1;
}

function cmd_tags(){
	echo "defining tags layout.";
	tag $1;
}

function cmd_trunk(){
	echo "defining trunk layout.";
	trunk $1;
}

function run_cmd(){
	if [ $# -eq 1 ]; then
        echo "Running: $1"
    fi

    if [[ $execute -eq "1" ]]; then 
		$1
	fi

	if [ "$?" -ne "0" ]; then
	  echo "command failed: $1"
	  exit 1
	fi
}

function cmd_get_branches_infos(){
	echo "Getting all branches iinformation... local and remote!"
	get_branches_infos;
}