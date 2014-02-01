#!/usr/bin/env bash
#
# svn-to-git-migrator commands gateway.
source $(dirname $0)/builtin/die.sh
source $(dirname $0)/builtin/username.sh

function cmd_die(){
	echo "will stop";
	die $1;
}

function cmd_username(){
	echo "defined the username to get from svn.";
	username $1;
}