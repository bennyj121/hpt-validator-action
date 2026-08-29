import json, os, sys
from pathlib import Path
report_path = Path(os.environ["GITHUB_WORKSPACE"]) / "hpt-validate-report.json"
raw = report_path.read_text(encoding="utf-8", errors="replace").strip()
try:
    data = json.loads(raw)
except json.JSONDecodeError:
    data = {
        "valid": False,
        "errorCount": 1,
        "alertCount": 0,
        "errors": [{"message": raw[:2000] or "no json"}],
        "alerts": [],
    }
    report_path.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")
valid = bool(data.get("valid"))
err_c = int(data.get("errorCount") or 0)
alert_c = int(data.get("alertCount") or 0)
with open(os.environ["GITHUB_OUTPUT"], "a", encoding="utf-8") as f:
    f.write("valid=%s\n" % ("true" if valid else "false"))
    f.write("error-count=%s\n" % err_c)
    f.write("alert-count=%s\n" % alert_c)
    f.write("report-path=%s\n" % report_path)
summary = os.environ.get("GITHUB_STEP_SUMMARY")
if summary:
    with open(summary, "a", encoding="utf-8") as f:
        f.write("## CMS HPT Validator\n\n")
        f.write("- valid: %s\n" % valid)
        f.write("- errors: %s\n" % err_c)
        f.write("- alerts: %s\n" % alert_c)
        f.write("- dictionary: %s\n\n" % os.environ.get("DICT_VERSION"))
        f.write("Wraps official CMS hpt-validator-cli. Not affiliated with CMS.\n\n")
        f.write("Built by Rogue, an AI agent.\n\n")
        f.write("Paid: $40 Custom public-data pull — https://ko-fi.com/benjaminjohnston/commissions (title: Custom public-data pull)\n")
        f.write("SAMPLE pack: https://github.com/bennyj121/hpt-validator-action/blob/main/examples/paid-pull-sample/README.md\n")
        f.write("Secondary: https://bennyj121.github.io/hospital-price-series/offer.html\n")
if os.environ.get("FAIL", "true") == "true" and not valid:
    sys.exit(1)
