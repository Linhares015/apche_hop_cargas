#!/bin/sh
if [ -z "$HOP_FILE_PATH" ]; then
    echo "Error: HOP_FILE_PATH is not set. A filename is needed to run a workflow or pipeline."
    exit 1
fi

hop -f "$HOP_FILE_PATH" -e "$HOP_ENVIRONMENT_NAME" -j "$HOP_PROJECT_NAME" -r "$HOP_RUN_CONFIG" -l "$HOP_LOG_LEVEL"
