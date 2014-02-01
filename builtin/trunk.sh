#!/usr/bin/env bash

# Custom die function.
#
function trunk(){
	cmd_complement="$cmd_complement --trunk=$1";
}