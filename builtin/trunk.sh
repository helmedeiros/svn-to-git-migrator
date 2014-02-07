#!/usr/bin/env bash

# Custom die function.
#
function trunk(){
	trunk=$1;
}

function trunk_cmd(){
	cmd_complement="$cmd_complement --trunk=$trunk";
}