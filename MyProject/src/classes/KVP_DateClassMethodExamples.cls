/*****************************************************************************************************
 *@Created By   :Ashish Ranjan
 *@Created Date :07-10-2018 
 *@Class Nmae   :KVP_DateClassMethodExamples
 *@Description  :This class is for showing various Date class method and their implementation. 
 * ****************************************************************************************************/
public class KVP_DateClassMethodExamples {
    public static void implementationMethodOfDate(){
        
          //Adds the specified number of additional days to a Date.
          Date myDate = Date.newInstance(1960, 2, 17);
          Date newDate = mydate.addDays(2);
        
          //Adds the specified number of additional months to a Date
          date myDate1 = date.newInstance(1990, 11, 21);
          date newDate1 = myDate.addMonths(3);
          date expectedDate = date.newInstance(1991, 2, 21);
        
          //Adds the specified number of additional years to a Date
          date myDate2 = date.newInstance(1983, 7, 15);
          date newDate2 = myDate2.addYears(2);
          date expectedDate1 = date.newInstance(1985, 7, 15);
          system.assertEquals(expectedDate1, newDate2);
        
          //Returns the day-of-month component of a Date
          date myDate3 = date.newInstance(1989, 4, 21);
          Integer day = myDate3.day();
          system.assertEquals(21, day);
        
          //Returns the day-of-year component of a Date
          date myDate4 = date.newInstance(1998, 10, 21);
          Integer day1 = myDate4.dayOfYear();
          System.assertEquals(294, day1);
        
          //Returns the number of days between the Date that called the method and the specified date
          Date startDate = Date.newInstance(2008, 1, 1);
          Date dueDate = Date.newInstance(2008, 1, 30);
          Integer numberDaysDue = startDate.daysBetween(dueDate);
        
          //Returns the number of days in the month for the specified year and month (1=Jan)
          Integer numberDays = date.daysInMonth(1960, 2);
        
          //Returns the Date as a string using the locale of the context user
          // In American-English locale
          date myDate5 = date.newInstance(2001, 3, 21);
          String dayString = myDate5.format();
          system.assertEquals('3/21/2001', dayString);
        
          //Returns true if the specified year is a leap year
          system.assert(Date.isLeapYear(2004));
          //


           }

 }