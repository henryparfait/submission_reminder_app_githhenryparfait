#!/bin/bash

# Source the config file
source config/config.env

# Navigate to the app directory and start the reminder script
cd app
./reminder.sh

# Print a message indicating the app has started
echo "Reminder app has started successfully!"
