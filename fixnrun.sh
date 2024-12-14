#!/bin/bash

# Convert all .sh files from CRLF to LF
echo "Converting all .sh files from CRLF to LF..."
for file in *.sh; do
    if [ -f "$file" ]; then
        echo "Processing $file..."
        sed -i 's/\r$//' "$file"
    fi
done

# Make all .sh files executable
echo "Making all .sh files executable..."
chmod 777 *.sh

# Run the run_all.sh script
if [ -f "run_all.sh" ]; then
    echo "Running run_all.sh..."
    ./run_all.sh
else
    echo "run_all.sh script not found."
fi

echo "All tasks completed."
