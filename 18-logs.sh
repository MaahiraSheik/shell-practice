#!/bin/bash



LOGFILE="/var/log/myscript.log"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOGFILE"
}
log_info()  { echo "$(date '+%F %T') [INFO] $1"  >> "$LOGFILE"; }
log_warn()  { echo "$(date '+%F %T') [WARN] $1"  >> "$LOGFILE"; }
log_error() { echo "$(date '+%F %T') [ERROR] $1" >> "$LOGFILE"; }

log_info "Service started"
log_warn "Low disk space"
log_error "Failed to connect to database"
log "Script started"
log "Performing task..."
log "Script finished"