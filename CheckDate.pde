
// -----------------------------
// DATE + TIME
// -----------------------------

int checkDate() {
  int birthday = 0;
  boolean day = false; 
  boolean month = false;
  
  // Check Day
  println("The Day is " + day() + " and the date is " + birthDay);
  if(day() == birthDay ) {
    day = true;
    println("Matching Day");
  } 

  // Check Month
  println("The Month is " + month() + " and the date is " + birthMonth);
  if(month() == birthMonth ) {
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
