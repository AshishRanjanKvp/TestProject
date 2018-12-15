@isTest
public class TVRemoteControlTest {
    
    @isTest static void testIncreaseVolume(){
        TVRemoteControl tc = new TVRemoteControl(10);
        Integer newVolume = tc.increaseVolume(15);
        Integer newVolume1 = tc.increaseVolume(50);
        System.assertEquals(50, newVolume1);
        System.assertEquals(25, newVolume);
    }
    
    @isTest static void testDecreaseVolume(){
       TVRemoteControl tc = new TVRemoteControl(20);
       Integer newVloume = tc.decreaseVolume(10);
       Integer newVloume1 = tc.decreaseVolume(30);
        System.assertEquals(10, newVloume);
        System.assertEquals(0, newVloume1);
    }
    /*
    @isTest static void testIncreaseVolumeOnMax(){
        TVRemoteControl tc = new TVRemoteControl(50);
        Integer newVolume = tc.increaseVolume(20);
        System.assertEquals(50, newVolume);
    }
   
    @isTest static void testDecreaseVolumeOnMin(){
        TVRemoteControl tc = new TVRemoteControl(20);
        Integer newVolume = tc.decreaseVolume(30);
        System.assertEquals(0, newVolume);
    }
    */
    @isTest static void testGetMenuOptions(){
        String menu =TVRemoteControl.getMenuOptions();
        System.assertNotEquals(null, menu);
        System.assertNotEquals('', menu);
    }

}