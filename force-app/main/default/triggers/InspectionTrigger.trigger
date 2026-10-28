trigger InspectionTrigger on Inspection__c (before insert, before update) {
    InspectionAutomationService.validateRecords(Trigger.new);
}
