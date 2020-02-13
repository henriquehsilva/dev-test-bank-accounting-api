#!/bin/sh
HOOKS="pre-commit-rspec pre-commit-rubocop"


for hook in $HOOKS; do
    if [ -f "$PWD/.git/hooks/$hook" ]; then
        echo "========================================================"
        "$PWD/.git/hooks/$hook"
        if [ $? != 0 ]; then
            exit 1
        fi
    else
        echo "Error: file $hook not found."
        exit 1
    fi
done
