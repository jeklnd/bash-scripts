#!/bin/bash/env bash

set -o errexit # exit immediately on non-zero status
set -o nounset # exit immediately on undeclared variables
set -o pipefail # exit immediately on non-zero status within a pipeline

# trace what gets executed when the script is run with TRACE=1
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

touch index.html
touch index.js
mkdir css
touch css/styles.css
touch .gitignore
touch README.md