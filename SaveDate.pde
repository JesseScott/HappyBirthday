
// -----------------------------
// DATE + TIME
// -----------------------------

void saveDate() {

  // Store data
  data[0] = dayField.getText();
  data[1] = monthField.getText();
  data[2] = yearField.getText();
  saveStrings("birthday.txt", data);
  
  // Timer
  checkTime = true;
  time = millis();

}

boolean runTimeout() {
  boolean ready = false;  
  if((millis() - time) >= 2000 ) {
     ready = true; 
  }
  return ready;
}

