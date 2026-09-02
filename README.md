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

## Sister Actions

- Index fetch / CPT extract: [hospital-mrf-index](https://github.com/marketplace/actions/hospital-mrf-index)
- Index file (`cms-hpt.txt`) validator: [cms-hpt-validate](https://github.com/bennyj121/cms-hpt-validate)

## License

MIT
