#!/bin/bash

# Script to move Docker Desktop to workspace 5 on startup
# For Linux Mint Cinnamon (assumes Docker Desktop auto-starts)

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> /tmp/docker-workspace.log
}

# Wait for desktop environment and Docker Desktop to be ready
sleep 4 

log_message "Starting Docker Desktop workspace move script"

# Wait for Docker Desktop to be fully loaded
max_attempts=30
attempt=0

while [ $attempt -lt $max_attempts ]; do
    # Check if Docker Desktop window exists
    DOCKER_WINDOW=$(wmctrl -l | grep -i "docker desktop\|docker" | head -1 | awk '{print $1}')
    
    if [ -n "$DOCKER_WINDOW" ]; then
        log_message "Found Docker Desktop window: $DOCKER_WINDOW"
        break
    fi
    
    log_message "Waiting for Docker Desktop window... (attempt $((attempt + 1))/$max_attempts)"
    sleep 2
    attempt=$((attempt + 1))
done

if [ -z "$DOCKER_WINDOW" ]; then
    log_message "Docker Desktop window not found after $max_attempts attempts"
    exit 1
fi

# Move Docker Desktop to workspace 5 (0-indexed, so workspace 4)
log_message "Moving Docker Desktop to workspace 5"
wmctrl -i -r "$DOCKER_WINDOW" -t 4
