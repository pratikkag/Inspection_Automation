# AI-Powered Inspection & Customer Support Automation (Salesforce)

A Salesforce-native project blueprint for managing inspection records and generating consistent AI-assisted inspection summaries with Salesforce Prompt Builder. It also documents an optional customer-support workflow that can use inspection outcomes to assist support agents.

> **Implementation status:** This repository contains project documentation, Salesforce metadata source files where practical, configuration guides, and test plans. It has **not** been deployed to a Salesforce org or tested in a live org. Prompt Builder templates and some Lightning/Flow setup are org-specific and must be configured and validated in Salesforce.

## Goals
- Manage inspection records in Salesforce.
- Capture inspection date, status, inspector, and notes.
- Generate an inspection summary with a Prompt Builder Field Generation template.
- Show inspection information and AI-generated summary on a Lightning record page.
- Apply validation and least-privilege access controls.
- Provide a foundation for customer-support staff to use inspection outcomes when responding to customers.

## Architecture
- **Custom object:** `Inspection__c`
- **Prompt Builder:** Field Generation template that generates `AI_Summary__c`
- **Lightning App Builder:** Inspection record page
- **Validation:** Inspection date and status rules
- **Security:** Profiles/permission sets, object permissions, field-level security, sharing settings
- **Optional support extension:** Cases linked to inspection records, subject to org-specific configuration

## Repository layout
```text
force-app/main/default/
  objects/Inspection__c/
    Inspection__c.object-meta.xml
    fields/Inspection_Date__c.field-meta.xml
    fields/Inspection_Status__c.field-meta.xml
    fields/Inspector_Name__c.field-meta.xml
    fields/Inspection_Notes__c.field-meta.xml
    fields/AI_Summary__c.field-meta.xml
    fields/Customer_Name__c.field-meta.xml
    fields/Related_Case_Number__c.field-meta.xml
  validationRules/
    Inspection_Date_Not_Future.validationRule-meta.xml
  permissionsets/
    Inspection_User.permissionset-meta.xml
  classes/
    InspectionAutomationService.cls
    InspectionAutomationService.cls-meta.xml
  triggers/
    InspectionTrigger.trigger
    InspectionTrigger.trigger-meta.xml
config/
  prompt-builder-template.md
  lightning-record-page-guide.md
  flow-guide.md
  security-guide.md
docs/
  functional-scope.md
  stakeholder-mapping.md
  execution-roadmap.md
  testing-plan.md
  deployment-guide.md
```

## Prerequisites
- Salesforce Developer Edition org or a Salesforce Trailhead Playground with access to the required features.
- Salesforce CLI (`sf`) for source deployment.
- Node.js only if your chosen Salesforce CLI installation requires it.
- Prompt Builder access and an AI-enabled Salesforce org/license for live AI generation. Availability and limits depend on your Salesforce org and licenses.

## Quick start
1. Install Salesforce CLI and authenticate:
   ```bash
   sf org login web --alias inspection-dev
   ```
2. Confirm the org:
   ```bash
   sf org display --target-org inspection-dev
   ```
3. Deploy metadata:
   ```bash
   sf project deploy start --source-dir force-app/main/default --target-org inspection-dev
   ```
4. Assign the permission set:
   ```bash
   sf org assign permset --name Inspection_User --target-org inspection-dev
   ```
5. In Salesforce Setup, create/configure the Prompt Builder Field Generation template using `config/prompt-builder-template.md`. Bind the template to `Inspection__c.AI_Summary__c`, if supported by your org's template configuration.
6. Follow the Lightning page and Flow guides in `config/`.
7. Run the Apex tests in your org:
   ```bash
   sf apex run test --target-org inspection-dev --result-format human
   ```
8. Verify all behavior manually using `docs/testing-plan.md`. Do not mark as complete until tested in your org.

## Important implementation notes
- Prompt Builder templates are typically configured and activated through Salesforce Setup; the template text in this repository is a setup artifact, not a deployable template metadata file.
- Lightning record pages may be configured in Setup. If you create a page manually, include the `AI Summary` field and the standard record details.
- The Apex service/trigger in this repository validates core data and demonstrates an extension point. It does **not** call Prompt Builder or generate AI summaries. AI generation is performed by the configured Prompt Builder Field Generation action.
- The validation rule prevents a future inspection date; remove or adjust it if future-dated inspections are valid for your use case.
- A text field for inspector name is used to keep the starter package portable. In a production org, consider a lookup to `User` instead.
- `Related_Case_Number__c` is a text reference, not a Salesforce Case relationship. Replace with a proper relationship if your schema and process require it.

## Customer support extension
To connect support cases, consider a lookup relationship from Case to Inspection, or a junction object if one case can relate to multiple inspections. Define case visibility, sharing, and consent requirements before exposing inspection details to support staff. This starter does not automatically modify the standard Case object.

## Suggested next improvements
- Replace `Inspector_Name__c` with a User lookup.
- Add a proper Case lookup relationship.
- Add record-triggered or screen flows for assignment, notifications, and escalation.
- Add dashboards for status and inspection volume.
- Add a review step before AI-generated content is shared externally.
