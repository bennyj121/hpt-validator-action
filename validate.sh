#!/bin/bash
set -euo pipefail
report="${GITHUB_WORKSPACE}/hpt-validate-report.json"
args=("$FILE" "$DICT_VERSION" -o json -e "$ERROR_LIMIT")
if [ -n "${FORMAT:-}" ]; then args+=(-f "$FORMAT"); fi
set +e
cms-hpt-validator "${args[@]}" > "$report"
set -e
python3 "${GITHUB_ACTION_PATH}/parse_report.py"
