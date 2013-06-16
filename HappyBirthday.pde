

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


// -----------------------------
// VARIABLES
// -----------------------------

int birthMonth = 06;
int birthDay = 22;

String[] fontList;
PFont font;

int screen = 0;
color col = color(255, 0, 0);

ParticleSystem[] ps = new ParticleSystem[5];
PImage sprite;

PImage cake;
PVector[] candle = new PVector[5];


// -----------------------------
// SETUP
// -----------------------------

void setup() {
  // Draw
  size(displayWidth, displayHeight, P2D);
  orientation(PORTRAIT);
  background(col);
  
  // Image
  cake = loadImage("cake.png");
  
  // Candles
  candle[0] = new PVector(200, 695);
  candle[1] = new PVector(295, 735);
  candle[2] = new PVector(345, 650);
  candle[3] = new PVector(420, 730);
  candle[4] = new PVector(485, 700);
  
  // Particles
  sprite = loadImage("sprite.png");
  for(int i = 0; i < 5; i++) {
    ps[i] = new ParticleSystem(400);  
  }
  hint(DISABLE_DEPTH_MASK);
  
  // Font
  fontList = PFont.list();
  font = createFont(fontList[4], 40, true);
  textFont(font);
  
  // Screen
  screen = checkDate();

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
  
  // Not Yet
  if(screen == 1) {
    // Text
    text("It's Not Your Birthday \nJust Yet... :-(", 100, height/2);
  }
  // Yes !!
  else if(screen == 2) {
    // Text
    textSize(60);
    text("Happy Birthday!!!", 150, height/3);
    
    // Image
    image(cake, 100, height /2, 3*(width/4), 3*(width/4));

    // Fireworks
    for(int i = 0; i < 5; i++) {
      ps[i].update();
      ps[i].display();
      ps[i].setEmitter(candle[i].x, candle[i].y);  
    }

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
