@isTest
public class AssessmentPeriode_t {
	@isTest static void periodName(){
        
        RecordType rtAssper = [
            SELECT Id
            FROM RecordType
            WHERE Name = 'Live Chat' AND SobjectType = 'AssessmentPeriod__c'
            
        ];

        
  		AssessmentPeriod__c asperi = new AssessmentPeriod__c();  
        asperi.name = 'mardoy';
        asperi.Start_Date__c = Date.newInstance(2019, 09, 01);
        asperi.End_Date__c = Date.newInstance(2019, 09, 15);
        asperi.Agent_Name__c = 'Ahmad Baihaqi';
		asperi.RecordTypeId = rtAssper.Id ;
        asperi.Reviewer__c = 'anissa';
		insert asperi;
		
        System.assert(asperi.Id != null);
    }
}