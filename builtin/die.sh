#!/usr/bin/env bash

# Custom die function.
#
function die() { 
	echo >&2 -e "\nERROR: $@\n"; 
	exit 1; 
}