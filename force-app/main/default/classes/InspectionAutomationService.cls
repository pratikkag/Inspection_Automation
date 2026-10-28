public with sharing class InspectionAutomationService {
    public static void validateRecords(List<Inspection__c> records) {
        for (Inspection__c inspection : records) {
            if (inspection.Inspection_Status__c == 'Completed' &&
                String.isBlank(inspection.Inspection_Notes__c)) {
                inspection.addError('Add inspection notes before marking an inspection Completed.');
            }
        }
    }
}
