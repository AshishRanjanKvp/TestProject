/**********************************************************************************************************************************
 * @Created By: Aashish Ranjan
 * @Created Dtae: 20-11-2018
 * @Class Name:Helper_ContactMail
 * @Description: Helper class for ContactMail Trigger.
 * *******************************************************************************************************************************/
public class Helper_ContactMail {
    
    public static void sendMail(List<Contact> conList){
        //System.debug('Methoddddddddddddddddd');
        List<Messaging.SingleEmailMessage> mails = new list<Messaging.SingleEmailMessage>(); 
        List<Case> cse = new List<Case>();
        for(Contact con:conList){
            if(con.Email!=null && con.Name!=null){
                Case cs = new Case(Contactid=con.id);
                cs.Status='New';
                cs.Origin='Web';
                cse.add(cs);
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                System.debug('for lopppppppppppppppppppppp');
                List<String> sendTo = new list<String>();
                sendTo.add(con.Email);
                mail.setToAddresses(sendTo);
                
                mail.setReplyTo('ashisharms2@gmail.com');
                mail.setSenderDisplayName('ashish Ranjan');
                
                List<String> ccTo = new List<String>();
                ccTo.add('ashish001.2018@rediff.com');
                mail.setCcAddresses(ccTo);
                
                mail.setSubject('URGENT BUSINESS PROPOSAL');
                String body = 'Dear ' + con.FirstName;
                
                 mail.setHtmlBody(body);
                
                mails.add(mail);
            }
        }
        System.debug('sendddddddddddddddddddddddddddddddddddddd');
        insert(cse);
        system.debug('the case got inserted');
        try{
        Messaging.sendEmail(mails);
        }catch(Exception e){
            system.debug('there is an exception' + e.getMessage() + e.getLineNumber());
        }
    }

}