#!/bin/bash
# Updates i3blocks on every jack/headphone event

case "$1" in
    jack/headphone)
        case "$2" in
            HEADPHONE)
                pkill -RTMIN+10 i3blocks
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac
