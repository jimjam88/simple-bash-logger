#!/bin/bash

LOG_LEVEL="DEBUG"

# Get the numeric log level and the coloured text
case $LOG_LEVEL in
    "OFF")    NUMERIC_LEVEL=-1;;
    "FATAL")  NUMERIC_LEVEL=0;;
    "ERROR")  NUMERIC_LEVEL=1;;
    "WARN")   NUMERIC_LEVEL=2;;
    "NOTICE") NUMERIC_LEVEL=3;;
    "INFO")   NUMERIC_LEVEL=4;;
    "DEBUG")  NUMERIC_LEVEL=5;;
esac

# Write to the console if the level is within the configured serverity
write() {
    if [[ $NUMERIC_LEVEL -ge $2 ]]
        then
        echo -e "[$(date +"%Y-%m-%d %H:%M:%S")] $3 - $1"
    fi
}

fatal() {
    write "$1" 0 "\033[41m\033[1mFATAL \033[0m"
}
error() {
    write "$1" 1 "\033[31mERROR\033[0m "
}

warn() {
    write "$1" 2 "\033[1;33mWARN  \033[0m"
}

notice() {
    write "$1" 3 "\033[1;34mNOTICE\033[0m"
}

info() {
    write "$1" 4 "\033[1;36mINFO  \033[0m"
}

debug() {
    write "$1" 5 "\033[1mDEBUG \033[0m"
}

fatal "This is a message"
error "This is a message"
warn "This is a message"
notice "This is a message"
info "This is a message"
debug "This is a message"