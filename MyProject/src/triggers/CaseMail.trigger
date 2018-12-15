/**********************************************************************************************************************************
 * @Created By: Aashish Ranjan
 * @Created Dtae: 20-11-2018
 * @Class Name:CaseMail
 * @Description: Trigger used to send mail when a Case is created.
 * *******************************************************************************************************************************/
trigger CaseMail on Case (before insert, before Update) {
     if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
          Helper_CaseMail.sendMail(Trigger.new);
     }
}