#!/bin/bash
echo "Creating the virtual environment..."
python -m venv venv
if [ $? eq - 0 ]; then
    echo "Virtual environment created."
elif [ $? ne - 0 ]; then
    echo "Creating virtual environment failed."

echo "Activating virtual environment in venv/bin/activate..."
. venv/bin/activate || . venv/scripts/activate
status=$?
if [ $? eq - 0 ]; then
    echo "Virtual environment activated."
elif [ $? ne - 0 ]; then
    echo "Activated virtual environment failed."

echo "Creating .gitignore..."
echo "venv/" > .gitignore
if [ $? eq - 0 ]; then
    echo ".gitignore created."
elif [ $? ne - 0 ]; then
    echo "Creating .gitignore failed."

echo "Adding requirements to requirements.txt..."
python -m pip freeze > requirements.txt
if [ $? eq - 0 ]; then
    echo "requirements.txt created."
elif [ $? ne - 0 ]; then
    echo "Creating requirements.txt failed."