#!/bin/bash
set -euo pipefail
export PATH="${RUNNER_TEMP}/hptcli/bin:${PATH}"
report="${GITHUB_WORKSPACE}/hpt-validate-report.json"
args=("$FILE" "$DICT_VERSION" -o json -e "$ERROR_LIMIT")
if [ -n "${FORMAT:-}" ]; then args+=(-f "$FORMAT"); fi
BIN="${RUNNER_TEMP}/hptcli/bin/cms-hpt-validator"
if [ ! -x "$BIN" ]; then BIN=$(command -v cms-hpt-validator || true); fi
if [ -z "${BIN}" ] || [ ! -x "$BIN" ]; then echo "cms-hpt-validator not found"; ls -la "${RUNNER_TEMP}/hptcli" || true; ls -la "${RUNNER_TEMP}/hptcli/bin" || true; exit 1; fi
set +e
"$BIN" "${args[@]}" > "$report"
set -e
python3 "${GITHUB_ACTION_PATH}/parse_report.py"
