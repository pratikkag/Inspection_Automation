# Optional Salesforce Flow guide

## Flow A — Inspection creation quality check (record-triggered)
- Object: Inspection
- Trigger: created or updated
- Entry condition: Inspection Status is populated
- Suggested actions: set an internal review flag or notify the inspection manager if required fields are missing.
- Avoid duplicating the validation rule already included in the starter.

## Flow B — Inspection status notification (optional)
- Object: Inspection
- Trigger: updated
- Entry condition: status changes to `Completed`
- Action: send an email alert or custom notification to an authorized manager.
- Ensure notification recipients and email deliverability are configured in the org.

## Build notes
Create Flows in Setup → Flows. Names, email templates, sender configuration, and recipient IDs vary by org, so configure them directly in Salesforce rather than assuming org-specific identifiers.
