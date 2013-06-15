

// -----------------------------
// IMPORTS
// -----------------------------

import android.content.Context;
import android.app.Activity;
import android.os.Bundle;
import android.view.WindowManager;
import android.view.Window;
import android.os.Environment;

import apwidgets.*;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.IOException;

// -----------------------------
// DECLARATIONS
// -----------------------------

APWidgetContainer widgetContainer; 
APEditText monthField, dayField, yearField;
APButton submitButton;

// -----------------------------
// VARIABLES
// -----------------------------

boolean enteredBirthday = false;
String birthMonth = "";
String birthDay = "";
String birthYear = "";
String debug = "";

String[] saveData = new String[3];
String[] readData;
String dirName;

int buttonAlignment = 500;
int dayHeight = 300;
int monthHeight = 400;
int yearHeight = 500;
int buttonHeight = 600;

String[] fontList;
PFont font;

int screen = 0;
color col = color(255, 0, 0);

boolean checkTime = false;
int time = 0;
int timout = 2000;

PImage cake;


// -----------------------------
// SETUP
// -----------------------------

@Override
public void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);

}

void setup() {
  // Draw
  size(displayWidth, displayHeight, P2D);
  orientation(PORTRAIT);
  background(col);
  
  // Image
  cake = loadImage("cake.png");
  
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
  
  // Directory
  try{
    dirName = "//sdcard//HappyBirthday";
    File newFile = new File(dirName);
    if(newFile.exists() == false) {
      //println("Creating directory");
      newFile.mkdirs();
    } 
    else {
      //println("Directory already exists");
    }
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  
  // File
  try {
    String path = "//sdcard//HappyBirthday//birthday.txt";
    File file = new File(path);
    readData = loadStrings(file);
    println("There are " + readData.length + " lines in the file");
    for(int i = 0; i < readData.length; i++) {
      println(readData[i]); 
    }
    if(readData.length == 3) {
      println("setting entered to true");
      enteredBirthday = true; 
    }
    else {
      println("setting entered to false");
      enteredBirthday = false;
    }
  }
  catch(Exception e) {
    e.printStackTrace();
    println("There doesn't seem to be a file yet...");
    enteredBirthday = false;
  }
  
  // Screen
  if(enteredBirthday) {
    println("weve entered, now lets check the date");
    screen = checkDate();
  }
  else {
    println("you need to enter your date");
    screen = 0;
  }
  
  println("----");
  println("-- HappyBirthday --");
  println("----");
  
}

// -----------------------------
// DRAW
// -----------------------------

void draw() {
  // BG
  background(col);
  
  // Text Entry
  if(screen == 0) {
    // Buttons
    widgetContainer.show();
    
    // Text
    text("You Haven't Entered \nYour Birthday Yet...", 100, 100);
    text("Put the day here:", 100, dayHeight);
    text("Put the month here:", 100, monthHeight);
    text("Put the year here:", 100, yearHeight);
    text("When you're done, \npress this button:", 100, buttonHeight);
    text(debug, 100, buttonHeight + 200);
    
    // Timer
    if(checkTime) {
      if(runTimeout()) {
        println("Checking Date...");
        screen = checkDate();
      }
    }
  }
  // Not Yet
  else if(screen == 1) {
    widgetContainer.hide();
    text("It's Not Your Birthday \nJust Yet... :-(", 100, height/2);
  }
  // Yes !!
  else if(screen == 2) {
    widgetContainer.hide();
    text("It's  Your Birthday!!!", 100, 100);
    image(cake, 100, height /2, 3*(width/4), 3*(width/4));
  }
  
}

// -----------------------------
// LIFECYCLE
// -----------------------------

@Override
void onResume() {
  super.onResume();

}

@Override
void onPause() {
  super.onPause();
  
}
