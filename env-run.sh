#!/bin/bash

workspaceFolder=$(dirname "$(readlink -f "$0")")
export VK_ICD_FILENAMES="$workspaceFolder/lib/vk_swiftshader_icd.json"
exec "$workspaceFolder/$1"
