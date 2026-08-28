#!/bin/bash
set -euo pipefail
report="${GITHUB_WORKSPACE}/hpt-validate-report.json"
args=("$FILE" "$DICT_VERSION" -o json -e "$ERROR_LIMIT")
if [ -n "${FORMAT:-}" ]; then args+=(-f "$FORMAT"); fi
BIN="${RUNNER_TEMP}/hptcli/node_modules/.bin/cms-hpt-validator"
if [ ! -x "$BIN" ]; then BIN="${RUNNER_TEMP}/hptcli/bin/cms-hpt-validator"; fi
if [ ! -x "$BIN" ]; then echo "cms-hpt-validator not found under $RUNNER_TEMP/hptcli"; find "${RUNNER_TEMP}/hptcli" -name "cms-hpt-validator*" 2>/dev/null | head; exit 1; fi
set +e
"$BIN" "${args[@]}" > "$report"
set -e
python3 "${GITHUB_ACTION_PATH}/parse_report.py"
