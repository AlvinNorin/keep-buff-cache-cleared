#!/bin/bash

# Function to clear cache
clear_cache() {
    echo 3 > /proc/sys/vm/drop_caches
}

# Monitoring loop
while true; do
    # Get the buffer/cache size in KiB
    cache_size=$(free -k | awk '/^Mem:/ {print $6}')
    
    # Convert KiB to MiB
    cache_size_mib=$((cache_size / 1024))
    
    # If cache size exceeds 1024 MiB (1 GiB), clear the cache
    if [ "$cache_size_mib" -gt 1024 ]; then
        clear_cache
        echo "$(date): Cleared cache, it exceeded 1 GiB" >> /var/log/cache_clear.log
    fi
    
    # Wait for 1 second before checking again
    sleep 1
done
