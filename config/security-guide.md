# Security guide

- Use least privilege: grant only required object and field access.
- Configure organization-wide defaults and sharing rules based on the sensitivity of inspection data.
- Use a permission set for inspection users; avoid broad administrator permissions for ordinary users.
- Review field-level security for `Inspection_Notes__c`, `Customer_Name__c`, and `AI_Summary__c`.
- Confirm that generated summaries do not expose data the running user cannot access.
- Test access with at least one authorized and one unauthorized user.
- Use synthetic/demo data in development.
- Do not place credentials, access tokens, customer records, or secrets in this repository.
- Review AI output before using it in customer-facing communications.
