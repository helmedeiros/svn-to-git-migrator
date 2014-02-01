#!/usr/bin/env bash

# Custom die function.
#
function username(){
	cmd_complement="--username=$1 $cmd_complement";
}