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

cat <<EOL > ~/shell_scripting_lab/submission_reminder_app/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOL
chmod u+x ~/shell_scripting_lab/submission_reminder_app/app/reminder.sh
