@isTest  // Defining Test-Class
public class Test_Example_1 {
  @isTest   // Defining Test-Method
    static void testMe(){ 
        // Whichever class you want to test; create an Object for that class 
        Apex_Test_1 a =new Apex_Test_1();   
        a.callMe(); 
        // System.assertEquals(Expected_value, Actual_Value, Error_Msg_optional); 
        //Wheather the Method is running properly; it will verify by comparing the Expected
        // value with the Actual value. If comparison fails Error message will be shown
        System.assertEquals('Wipro',a.name);
        System.assertEquals('Hyd',a.city);
    }
}