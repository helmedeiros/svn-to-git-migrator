#!/usr/bin/env bash

# Branch action.
#
function get_branches_infos(){
	LOCAL_BRANCHES=(`git branch -l --no-color`);
	REMOTE_BRANCHES=(`git branch -r --no-color`);

	echo "LOCAL->";
	echo ${LOCAL_BRANCHES[@]} 

	echo "REMOTE->";
	echo ${REMOTE_BRANCHES[@]} 
	
}