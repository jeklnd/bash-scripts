#!/bin/bash/env /bash
set -o errexit # abort on nonzero exit status
set -o nounset # abort on unbound variable
set -o pipefail # don't hide error within pipes

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