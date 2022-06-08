public class FAQController {
    public String title;
    public String answer;
    
    public void InitData(){
        String page_id = ApexPages.currentPage().getParameters().get('id');
        Knowledge__kav knowledge = [SELECT Title, Answer__c FROM Knowledge__kav LIMIT 1];
        if (page_id != null)  {
            knowledge = [SELECT Title, Answer__c FROM Knowledge__kav WHERE Id= :page_id];
        }
        SetTitle(knowledge.Title);
        SetAnswer(knowledge.Answer__c);
    }
    public void SetTitle(String da){
        title = da;
    }
    
    public void SetAnswer(String ans){
        answer = ans;
    }
    
    public String GetTitle(){
        return title;
    }
    
    public String GetAnswer(){
        return answer;
    }
}