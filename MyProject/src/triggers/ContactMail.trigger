/**********************************************************************************************************************************
 * @Created By: Aashish Ranjan
 * @Created Dtae: 20-11-2018
 * @Trigger Name:ContactMail
 * @Description: Trigger used to send mail when a Contact is created.
 * *******************************************************************************************************************************/

trigger ContactMail on Contact (after insert, after Update) {
    if(Trigger.isAfter && Trigger.isInsert){
         System.debug('Triggeredddddddddddddddddd');
        Helper_ContactMail.sendMail(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        System.debug('Triggeredddddddddddddddddd');
        Helper_ContactMail.sendMail(Trigger.new);
    }
   
}