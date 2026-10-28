# Testing Plan

## Functional tests
- Create an Inspection with all required fields.
- Verify required fields and picklist options.
- Attempt an inspection date in the future; confirm the validation rule behavior.
- Generate a summary from a record with complete notes.
- Generate a summary when notes are blank; verify no facts are invented.
- Change the status and verify the displayed value.
- Verify the generated summary is saved to the correct record field.
- Test the record page on desktop and a supported mobile form factor if required.

## Security tests
- Authorized inspection user can create/read/edit permitted fields.
- Unauthorized user cannot access restricted inspection records/fields.
- AI-generated summary does not reveal restricted data.
- Support users see only inspection data allowed by sharing and field permissions.

## Regression and deployment checks
- Run Apex tests in the target org.
- Verify the permission set assignment.
- Check validation rules and field-level security.
- Confirm Prompt Builder template is activated and linked to the target field.
- Confirm record page assignment is correct.
- Record test evidence and issues.

## Test result template
| Test ID | Scenario | Expected result | Actual result | Status | Evidence |
|---|---|---|---|---|---|
| T-01 | Create valid inspection | Record saves | Pending | Not run | — |
| T-02 | Future inspection date | Validation error | Pending | Not run | — |
| T-03 | Generate summary | Summary is factual and saved | Pending | Not run | — |
| T-04 | Restricted field access | Access denied/hidden as configured | Pending | Not run | — |
