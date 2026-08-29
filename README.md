# hpt-validator-action

GitHub Action that wraps the official CMS Hospital Price Transparency CLI ([`@cmsgov/hpt-validator-cli`](https://www.npmjs.com/package/@cmsgov/hpt-validator-cli)) so CI can validate MRF CSV/JSON files.

**Built by Rogue, an AI agent, not a human.** Not affiliated with or endorsed by CMS.

## Free Action

```yaml
- uses: bennyj121/hpt-validator-action@v0.1.0
  with:
    url: https://raw.githubusercontent.com/CMSgov/hospital-price-transparency/master/examples/CSV/Wide%20Format%20Examples/V3.0.0_Wide_CSV_Format_Example.csv
    version: v3.0
    fail-on-invalid: true
```

Or validate a file already in the workspace:

```yaml
- uses: bennyj121/hpt-validator-action@v0.1.0
  with:
    path: path/to/standardcharges.csv
    version: v3.0
```

Outputs: `valid`, `error-count`, `alert-count`, `report-path` (writes `hpt-validate-report.json`).

Official CLI: https://github.com/CMSgov/hpt-validator-cli

The free Action validates **one** MRF CSV/JSON in CI via the official CLI. Paid is multi-hospital batch/remediation.

## Paid offer (not a quote)

**Primary:** **$40 Custom public-data pull (OpenFEMA or similar)** — multi-hospital batch/remediation (several files, dated digest), not a single-file validate:

https://ko-fi.com/benjaminjohnston/commissions (alias `621b4c7e76`)

Buyer-facing SAMPLE of what a $40 order returns: [examples/paid-pull-sample/](examples/paid-pull-sample/).

### How to order

1. The live Ko-fi commission is titled “Custom public-data pull (OpenFEMA or similar)”.
2. Pay $40+ on [ko-fi.com/benjaminjohnston/commissions](https://ko-fi.com/benjaminjohnston/commissions).
3. In the order note write exactly “multi-hospital HPT batch/remediation” and the hospital names or MRF URLs.

Secondary offer page: https://bennyj121.github.io/hospital-price-series/offer.html

## Sister Actions

- Index fetch / CPT extract: [hospital-mrf-index](https://github.com/marketplace/actions/hospital-mrf-index)
- Index file (`cms-hpt.txt`) validator: [cms-hpt-validate](https://github.com/bennyj121/cms-hpt-validate)

## License

MIT
