# Functional Scope

The project implements an AI-enabled inspection management and documentation workflow using Salesforce. Users create and manage inspection records containing the inspection date, status, inspector, customer reference, and notes.

Salesforce Prompt Builder Field Generation is configured to generate a factual inspection summary from the current record. Users trigger generation from the record page and save the result to the AI Summary field. Lightning App Builder provides a convenient record-page experience.

Validation rules and Salesforce access controls help maintain data quality and secure handling. An optional customer-support extension allows support users to consult inspection outcomes when responding to customer inquiries, subject to appropriate permissions.

## Objectives
- Maintain inspection records in Salesforce.
- Reduce manual documentation with AI-assisted summaries.
- Provide a consistent, user-friendly record page.
- Apply validation and least-privilege access.
- Establish a testable foundation for support workflows.
