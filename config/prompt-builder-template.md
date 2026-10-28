# Prompt Builder Field Generation template (manual setup)

## Template purpose
Generate a concise, factual inspection summary from the current `Inspection__c` record. This file documents the prompt to configure in Salesforce Setup; it is not a deployable Salesforce Prompt Template metadata file.

## Suggested template instructions
You are assisting an inspection team. Create a concise summary using only the inspection information provided below.

Rules:
- Do not invent facts, findings, dates, people, or outcomes.
- If a detail is missing, say it was not provided rather than guessing.
- Separate recorded facts from suggested follow-up actions.
- Use professional, neutral language.
- Do not include sensitive personal data unless it is necessary for the inspection summary.
- Output: 1) Inspection overview, 2) Recorded observations, 3) Follow-up needed (only if supported by the record).
- If inspection notes are blank, state that no notes were supplied.

## Record context to insert in Prompt Builder
Use the template editor's resource picker to insert the appropriate merge fields from the current Inspection record, such as:
- Inspection date
- Inspection status
- Inspector name
- Customer name/reference
- Inspection notes

Do not type guessed merge syntax: select the actual fields through the Prompt Builder resource picker for the org.

## Configure
1. Open **Setup → Prompt Builder**.
2. Create a **Field Generation** prompt template.
3. Select the `Inspection__c` object and the target field `AI_Summary__c` if supported by your org.
4. Paste the instructions above and insert record fields through the resource picker.
5. Save and test with several records, including missing notes and different statuses.
6. Activate the template if the UI requires activation.
7. Open an Inspection record and run the field-generation action.
8. Verify the result is saved to `AI_Summary__c`; review output before relying on it.

## Acceptance criteria
- Output uses only record facts.
- Missing information is not fabricated.
- Empty notes are handled gracefully.
- Summary is readable and appropriately concise.
- Generated text is saved to the intended field.
