#!/usr/bin/env bash

# Tag action.
#
function tag(){
	cmd_complement="$cmd_complement --tags=$1";
}