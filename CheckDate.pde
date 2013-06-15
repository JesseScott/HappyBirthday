
// -----------------------------
// DATE + TIME
// -----------------------------

int checkDate() {
  int birthday = 0;
  boolean day = false; 
  boolean month = false;
  
  // Check Day
  println("The Day is " + day() + " and the date is " + int(readData[0]));
  if(day() == int(readData[0]) ) {
    day = true;
    println("Matching Day");
  } 

  // Check Month
  println("The Month is " + month() + " and the date is " + int(readData[1]));
  if(month() == int(readData[1]) ) {
    month = true;
    println("Matching Month");
  }   
  
  // Match ?
  if(day && month) {
    birthday = 2;
    println("Birthday!!");
  }
  else {
    birthday = 1;
    println("Not yet :/");
  }
  
  return birthday;
}
