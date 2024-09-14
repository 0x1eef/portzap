#!/bin/sh

printok()
{
    printf "portzap: %s\n" "${1}" > /dev/stdout
}

printerr()
{
    printf "portzap: %s\n" "${1}" > /dev/stderr
}
