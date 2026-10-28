@IsTest
private class InspectionAutomationServiceTest {
    @IsTest
    static void allowsCompletedInspectionWithNotes() {
        Inspection__c record = new Inspection__c(
            Inspection_Date__c = Date.today(),
            Inspection_Status__c = 'Completed',
            Inspector_Name__c = 'Demo Inspector',
            Inspection_Notes__c = 'All checklist items reviewed.'
        );
        Test.startTest();
        insert record;
        Test.stopTest();
        System.assertNotEquals(null, record.Id);
    }

    @IsTest
    static void blocksCompletedInspectionWithoutNotes() {
        Inspection__c record = new Inspection__c(
            Inspection_Date__c = Date.today(),
            Inspection_Status__c = 'Completed',
            Inspector_Name__c = 'Demo Inspector'
        );
        Test.startTest();
        try {
            insert record;
            System.assert(false, 'Expected validation error for missing notes.');
        } catch (DmlException ex) {
            System.assert(ex.getMessage().contains('Add inspection notes'));
        }
        Test.stopTest();
    }

    @IsTest
    static void allowsPlannedInspectionWithoutNotes() {
        Inspection__c record = new Inspection__c(
            Inspection_Date__c = Date.today(),
            Inspection_Status__c = 'Planned',
            Inspector_Name__c = 'Demo Inspector'
        );
        insert record;
        System.assertNotEquals(null, record.Id);
    }
}
