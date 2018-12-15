trigger Account1 on Account (before insert) {
  Help1.createaccount(Trigger.new);
}