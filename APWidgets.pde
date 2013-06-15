
// -----------------------------
// APWIDGETS
// -----------------------------

void onClickWidget(APWidget widget){
  if(widget == submitButton){ 
    // Empty Fields
    if(monthField.getText().equals("") || dayField.getText().equals("") || yearField.getText().equals("")) {
      // Print message to screen
      debug = "Sorry, I think you missed one! \nTry again please!";
    }
    // Proper Format
    else if(monthField.getText().length() == 2 && dayField.getText().length() == 2 && yearField.getText().length() == 4) {
      // Print message to screen
      debug = "Perfect, thanks! \nOne sec while we save it!";
      
      // Save
      saveDate();
    }
    // Wrong Format
    else {
      // Print message to screen
      debug = "Sorry, wrong format... please \nput 2 digits for the day & month, \n& 4 for the year... ";
    }
  }
}
