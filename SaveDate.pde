
// -----------------------------
// DATE + TIME
// -----------------------------

void saveDate() {

  // Store data
  data[0] = dayField.getText();
  data[1] = monthField.getText();
  data[2] = yearField.getText();
  
  // Write Data
  try {
    BufferedWriter writer = new BufferedWriter(new FileWriter("//sdcard//HappyBirthday//birthday.txt", false));
    writer.write(data[0]);
    writer.write("\n");
    writer.write(data[1]);
    writer.write("\n");
    writer.write(data[2]);
    writer.write("\n");
    writer.flush();
    writer.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
  
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

