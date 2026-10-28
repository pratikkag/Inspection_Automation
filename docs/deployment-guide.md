# Deployment Guide

## Requirements
- Salesforce CLI (`sf`)
- Authenticated Developer Edition org or Trailhead Playground
- Appropriate permissions to deploy metadata and configure Prompt Builder

## Deploy
```bash
sf org login web --alias inspection-dev
sf org display --target-org inspection-dev
sf project deploy start --source-dir force-app/main/default --target-org inspection-dev
sf org assign permset --name Inspection_User --target-org inspection-dev
```

Run Apex tests:
```bash
sf apex run test --target-org inspection-dev --result-format human
```

## Post-deployment manual setup
1. Configure the Field Generation prompt template from `config/prompt-builder-template.md`.
2. Configure and activate the Lightning Record Page using `config/lightning-record-page-guide.md`.
3. Build optional flows using `config/flow-guide.md`.
4. Confirm profile, permission-set, sharing, and field-level security.
5. Execute all checks in `docs/testing-plan.md`.

## Rollback
Use a source-control commit to identify the previous version. Before destructive metadata changes, back up the org's current metadata and data. Deployment rollback procedures depend on the metadata type and org setup.
