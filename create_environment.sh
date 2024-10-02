#!/bin/bash

# Create main directory
mkdir -p submission_reminder_app

# Navigate into it
cd submission_reminder_app

# Create subdirectories
mkdir -p app modules assets config

# Create files inside 'app' directory
touch app/reminder.sh

# Create files inside 'modules' directory
touch modules/functions.sh

# Create files inside 'assets' directory
touch assets/submissions.txt

# Create files inside 'config' directory
touch config/config.env

# Create startup.sh in the main directory
touch startup.sh

