

// IMPORTS

import apwidgets.*;

// DECLARATIONS

APWidgetContainer widgetContainer; 
APEditText monthField, dayField, yearField;
APButton submitButton;



// VARIABLES

boolean enteredBirthday = false;
String birthMonth = "";
String birthDay = "";
String birthYear = "";
String[] data = new String[3];
String debug = "";

int buttonAlignment = 500;
int dayHeight = 300;
int monthHeight = 400;
int yearHeight = 500;
int buttonHeight = 600;

String[] fontList;
PFont font;

int screen = 0;
color col = color(255, 0, 0);


// SETUP

void setup() {
  size(displayWidth, displayHeight, P2D);
  orientation(PORTRAIT);
  background(col);
  
  // Text Field
  widgetContainer = new APWidgetContainer(this); 
  dayField = new APEditText(buttonAlignment, dayHeight - 25, 150, 75);
  monthField = new APEditText(buttonAlignment, monthHeight - 25, 150, 75); 
  yearField = new APEditText(buttonAlignment, yearHeight -25 , 150, 75);
  submitButton = new APButton(buttonAlignment, buttonHeight - 25, 150, 75, "Submit");
  widgetContainer.addWidget(dayField);
  widgetContainer.addWidget(monthField); 
  widgetContainer.addWidget(yearField); 
  widgetContainer.addWidget(submitButton);
  
  // Font
  fontList = PFont.list();
  font = createFont(fontList[4], 40, true);
  textFont(font);
  
}



// DRAW

void draw() {
  background(col);
  
  if(screen == 0) {
    widgetContainer.show();
    text("You Haven't Entered \nYour Birthday Yet...", 100, 100);
    text("Put the day here:", 100, dayHeight);
    text("Put the month here:", 100, monthHeight);
    text("Put the year here:", 100, yearHeight);
    text("When you're done, \npress this button:", 100, buttonHeight);
    text(debug, 100, buttonHeight + 200);
  }
  else if(screen == 1) {
    widgetContainer.hide();
    
  }
  
}
