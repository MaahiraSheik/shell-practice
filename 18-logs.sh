#!/bin/bash



LOGFILE="/var/log/myscript.log"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOGFILE"
}

log "Script started"
log "Performing task..."
log "Script finished"