Public class Pagination_Example_2{
    public Apexpages.StandardSetController controller{set; get;}
    public Integer total {set; get;} // will store how many records we fetched
    public Integer pages {set; get;} // will store how many pages we have
    // This method will return a List of Opportunity
    public List<Opportunity> getOptyList(){ 
          // getRecords will fetch records in form of Sobject. So convert it into List of
          // Opportunity by adding (List<Opportunity>) before it
          List<Opportunity> optyList = (List<Opportunity>)controller.getRecords();
          return optyList;

    }
    
    // Constructor
    public Pagination_Example_2(){
          // Writing a SOQL to fetch a List of records with required fields and passing it 
          // to the StandardSetController 
          List<Opportunity> optyList =[select Id,Name,stageName,closeDate,Amount from 
                                       Opportunity];
          // Controller is defined Locally: so Datatype before it not required
          controller =new Apexpages.StandardSetController(optyList);
          // Define Per Page how many records you want to see
          controller.setPageSize(5);  
          total =controller.getResultSize(); // Total how many records we fetched 
          pages = total / 5; 
          // if toatal is not perfectly divided by 5; then there will be some remainder.
          // in that case, Total number of pages 
          Integer count = Math.mod(total , 5);
          If(count > 0){
             pages = pages + 1; // Creating an Extra page for the Remainder records.
          }  
    }    
}