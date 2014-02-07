#!/usr/bin/env bash

# Tag action.
#
function tag(){
	tags=$1;
	cmd_complement="$cmd_complement --tags=$1";
}

function tags_cmd(){
	cmd_complement="$cmd_complement --tags=$tags";
}