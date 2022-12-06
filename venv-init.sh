#!/bin/bash/env bash

###
# The following script creates a virtual environment, activates it, creates a .gitignore ignore venv/, and creates a requirements.txt.
# The script should be used in an empty python project directory. Ensure you're in the right directory before running the script.
###


set -o errexit # exit immediately on non-zero status
set -o nounset # exit immediately on undeclared variables
set -o pipefail # exit immediately on non-zero status within a pipeline

# trace what gets executed when the script is run with TRACE=1
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi


echo "Creating the virtual environment..."
python3 -m venv venv
if [ $? -eq 0 ]; then
    echo -e "     Virtual environment created.✔️\n"
elif [ $? -ne 0 ]; then
    echo -e "     Creating virtual environment failed.❌\n"
fi

echo "Activating virtual environment..."
. venv/bin/activate || . venv/scripts/activate
status=$?
if [ $? -eq 0 ]; then
    echo -e "     Virtual environment activated.✔️\n"
elif [ $? -ne 0 ]; then
    echo -e "     Activated virtual environment failed.❌\n"
fi

echo "Creating .gitignore..."
echo "venv/" > .gitignore
if [ $? -eq 0 ]; then
    echo -e "     .gitignore created.✔️\n"
elif [ $? -ne 0 ]; then
    echo -e "     Creating .gitignore failed.❌\n"
fi

echo "Adding requirements to requirements.txt..."
python -m pip freeze > requirements.txt
if [ $? -eq 0 ]; then
    echo -e "     requirements.txt created.✔️\n"
elif [ $? -ne 0 ]; then
    echo -e "     Creating requirements.txt failed.❌\n"
fi

echo "Creating main.py"
touch main.py
if [ $? -eq 0 ]; then
    echo -e "     main.py created.✔️\n"
elif [ $? -ne 0 ]; then
    echo -e "     Creating main.py failed.❌\n"
fi

echo "To exit the virutal environment, execute 'deactivate'."
echo "To help with debugging, execute the command with TRACE=1 e.g. 'TRACE=1 . ~/bash-scripts/venv-init.sh'"