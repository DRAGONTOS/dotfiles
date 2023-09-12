#!/bin/bash

if pactl list short modules | grep module-combine-sink; then
    pactl unload-module module-combine-sink
fi

# Define the name of the combined sink
combined_sink="combined-sink"

# Get a list of available sinks (excluding the combined sink if it exists)
sink_list=$(pactl list short sinks | grep -v "$combined_sink" | awk '{print $2}')

# Initialize an empty string to store the list of slaves
slaves=""

# Iterate through the sink list and add each sink as a slave
for sink in $sink_list
do
    slaves+="$sink,"
done

# Remove the trailing comma (,) from the slaves string
slaves=${slaves%,}

# Create the combined sink with all available sinks as slaves
pactl load-module module-combine-sink sink_name=combined-sink slaves=$slaves
