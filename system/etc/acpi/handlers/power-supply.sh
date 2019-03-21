#!/bin/bash
# Updates i3blocks battery indicator

case "$1" in
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0|ACPI0003:00)
                case "$4" in
                    00000000)
                        pkill -RTMIN+2 i3blocks
                        logger 'AC unpluged'
                        ;;
                    00000001)
                        pkill -RTMIN+2 i3blocks
                        logger 'AC pluged'
                        ;;
                esac
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    battery)
        case "$2" in
            BAT0|PNP0C0A:00)
                case "$4" in
                    00000000)
                        pkill -RTMIN+2 i3blocks
                        logger 'Battery online'
                        ;;
                    00000001)
                        pkill -RTMIN+2 i3blocks
                        logger 'Battery offline'
                        ;;
                esac
                ;;
            CPU0)
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac
