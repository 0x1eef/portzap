#!/bin/sh

printok()
{
    printf "ok: %s\n" "${1}" > /dev/stdout
}

printerr()
{
    printf "error: %s\n" "${1}" > /dev/stderr
}
