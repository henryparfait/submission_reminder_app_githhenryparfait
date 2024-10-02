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
source ../config/config.env
source ../modules/functions.sh

# Path to the submissions file
submissions_file="../assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions \$submissions_file
EOL
chmod u+x ~/shell_scripting_lab/submission_reminder_app/app/reminder.sh

cat <<EOL > ~/shell_scripting_lab/submission_reminder_app/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file") # Skip the header
}
EOL
chmod u+x ~/shell_scripting_lab/submission_reminder_app/modules/functions.sh

cat <<EOL > ~/shell_scripting_lab/submission_reminder_app/config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

cat <<EOL > ~/shell_scripting_lab/submission_reminder_app/startup.sh
#!/bin/bash

# Source the config file
source config/config.env

# Navigate to the app directory and start the reminder script
cd app
./reminder.sh

# Print a message indicating the app has started
echo "Reminder app has started successfully!"
EOL

# Make startup.sh executable
chmod u+x startup.sh

# Add 5 additional student records to submissions.txt

cat <<EOL > ~/shell_scripting_lab/submission_reminder_app/assets/submissions.txt

student, assignment, submission status
here, Shell Navigation, submitted
Noel, Shell Navigation, not submitted
Henry, Shell Navigation, submitted
Manzi, Shell Navigation, submitted
Igor, Shell Navigation, not submitted
Jimmy, Shell Navigation, not submitted
Claudia, Shell Navigation, submitted
EOL

