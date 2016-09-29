
// INVOFIS - PRACTICAL 3
// Visualisation made up by three pages (defined by the index "page"== 0,1,2) that can be navigated through a button
// For pages 1 and 2 the package "org.gicentre.utils.stat" is needed

// Source code for the buttons: https://processing.org/examples/button.html

// Creates all the objects needed 
Table revenues;
Table dogs;
Table django;
Table bastards;
Table brown;
Table bill1;
Table bill2;
Table pulp;
PFont f;
PFont f2;
PFont f1;
int tabY= 400;
int tabX = 100;
int val = 0;

Table dogs_counts;
Table django_counts;
Table bastards_counts;
Table brown_counts;
Table bill1_counts;
Table bill2_counts;
Table pulp_counts;


int rectX, rectY, rectX2, rectY2, rectX3, rectY3;   
int rectWidth = 40;
int rectWidth2 = 73;
int rectHeight = 20;     
color rectColor, baseColor;
color rectHighlight;
color currentColor;
boolean rectOver = false, rectOver2 = false, rectOver3 = false;
Table swearCount;
float count;
int page = 0;

import org.gicentre.utils.stat.*;    // The package for the bar chart
 
BarChart barChart;
BarChart barChart1;
BarChart barChart2;
BarChart barChart3;
BarChart barChart4;
BarChart barChart5;
BarChart barChart6;
BarChart barChart7;
XYChart scatterplot;

// Sets up the first page of the visualisation (the pattern graph) and defines the objects for the next pages
void setup() {
 size(1200,500);
 smooth();
 f2 = loadFont("ArabicTypesetting-48.vlw");
 f = loadFont("BellMTBold-48.vlw");
 f1 = createFont("Arial", 16, true);
 
 dogs = loadTable("dogs.csv", "header");      // Upload the data
 django = loadTable("django.csv", "header");
 bastards = loadTable("bastards.csv", "header");
 brown = loadTable("brown.csv", "header");
 bill1 = loadTable("bill1.csv", "header");
 bill2 = loadTable("bill2.csv", "header");
 pulp = loadTable("pulp.csv", "header");
 
 dogs_counts = loadTable("dogs_counts.csv", "header");      // Upload the data
 django_counts = loadTable("django_counts.csv", "header");
 bastards_counts = loadTable("bastards_counts.csv", "header");
 brown_counts = loadTable("brown_counts.csv", "header");
 bill1_counts = loadTable("bill1_counts.csv", "header");
 bill2_counts = loadTable("bill2_counts.csv", "header");
 pulp_counts = loadTable("pulp_counts.csv", "header");
 
 
  rectColor = color(0);
  rectHighlight = color(51);
  rectX  = 580;
  rectY = 450;
  rectX2  = 1100;
  rectY2 = 70;
  rectX3  = 1100;
  rectY3 = 100;
  
  barChart = new BarChart(this);
  barChart1 = new BarChart(this);
  barChart2 = new BarChart(this);
  barChart3 = new BarChart(this);
  barChart4 = new BarChart(this);
  barChart5 = new BarChart(this);
  barChart6 = new BarChart(this);
  barChart7 = new BarChart(this);
  swearCount = loadTable("swear_count.csv", "header");
  
  float[] y = new float[13];
  int i;
  for(i=0; i < 13; i = i+1) {
     y[i] = swearCount.getInt(i,1);
  }
 
  String[] x = new String[13];
  int j;
  for(j=0; j < 13; j = j+1) {
     x[j] = swearCount.getString(j,0);
  }

  // ------------------------------------------------------------------------------------------------- Extract values for the barcharts 
  float[] dogsy = new float[13];
  for(i=0; i < 13; i = i+1) {
     dogsy[i] = dogs_counts.getInt(i,1);
  } //<>//
  
  String[] dogsx = new String[13];
  for(j=0; j < 13; j = j+1) {
     dogsx[j] = dogs_counts.getString(j,0);
  }
  
  float[] djangoy = new float[13];
  for(i=0; i < 13; i = i+1) {
     djangoy[i] = django_counts.getInt(i,1);
  }
 
  String[] djangox = new String[13];
  for(j=0; j < 13; j = j+1) {
     djangox[j] = django_counts.getString(j,0);
  }
  
    float[] bastardsy = new float[14];
  for(i=0; i < 14; i = i+1) {
     bastardsy[i] = bastards_counts.getInt(i,1);
  }
 
  String[] bastardsx = new String[14];
  for(j=0; j < 14; j = j+1) {
     bastardsx[j] = bastards_counts.getString(j,0);
  }
  
    float[] browny = new float[13];
  for(i=0; i < 13; i = i+1) {
     browny[i] = brown_counts.getInt(i,1);
  }
 
  String[] brownx = new String[13];
  for(j=0; j < 13; j = j+1) {
     brownx[j] = brown_counts.getString(j,0);
  }
  
    float[] bill1y = new float[13];
  for(i=0; i < 13; i = i+1) {
     bill1y[i] = bill1_counts.getInt(i,1);
  }
 
  String[] bill1x = new String[13];
  for(j=0; j < 13; j = j+1) {
     bill1x[j] = bill1_counts.getString(j,0);
  }
  
    float[] bill2y = new float[13];
  for(i=0; i < 13; i = i+1) {
     bill2y[i] = bill2_counts.getInt(i,1);
  }
 
  String[] bill2x = new String[13];
  for(j=0; j < 13; j = j+1) {
     bill2x[j] = bill2_counts.getString(j,0);
  }
  
  float[] pulpy = new float[13];
  for(i=0; i < 13; i = i+1) {
     pulpy[i] = pulp_counts.getInt(i,1);
  }
 
  String[] pulpx = new String[13];
  for(j=0; j < 13; j = j+1) {
     pulpx[j] = pulp_counts.getString(j,0);
  }
  
  // ------------------------------------------------------------------------------------------------- END
  
 // ------------------------------------------------------------------------------------------------------- Define all barcharts      
  barChart.setData(y);        
  barChart.showValueAxis(true);                // All commands needed for the bar chart on page 1
  barChart.setBarLabels(x);
  barChart.showCategoryAxis(true);
  barChart.transposeAxes(false);
  barChart.setBarColour(color(#5165CE));
  barChart.setReverseCategories(false);
  barChart.updateLayout();                 // DON'T KNOW HOW TO CHANGE FONT/COLOUR TO THE AXIS!
  barChart.setBarGap(25);
  
  barChart1.setData(dogsy);        
  barChart1.showValueAxis(true);                
  barChart1.setBarLabels(dogsx);
  barChart1.showCategoryAxis(true);
  barChart1.transposeAxes(false);
  barChart1.setBarColour(color(#5165CE));
  barChart1.setReverseCategories(false);
  barChart1.updateLayout();                  
  barChart1.setBarGap(25);
  
  barChart2.setData(pulpy);        
  barChart2.showValueAxis(true);                // All commands needed for the bar chart on page 1
  barChart2.setBarLabels(pulpx);
  barChart2.showCategoryAxis(true);
  barChart2.transposeAxes(false);
  barChart2.setBarColour(color(#5165CE));
  barChart2.setReverseCategories(false);
  barChart2.updateLayout();                 // DON'T KNOW HOW TO CHANGE FONT/COLOUR TO THE AXIS!
  barChart2.setBarGap(25);
  
  barChart3.setData(browny);        
  barChart3.showValueAxis(true);                
  barChart3.setBarLabels(brownx);
  barChart3.showCategoryAxis(true);
  barChart3.transposeAxes(false);
  barChart3.setBarColour(color(#5165CE));
  barChart3.setReverseCategories(false);
  barChart3.updateLayout();                  
  barChart3.setBarGap(25);
  
  barChart4.setData(bill1y);        
  barChart4.showValueAxis(true);                // All commands needed for the bar chart on page 1
  barChart4.setBarLabels(bill1x);
  barChart4.showCategoryAxis(true);
  barChart4.transposeAxes(false);
  barChart4.setBarColour(color(#5165CE));
  barChart4.setReverseCategories(false);
  barChart4.updateLayout();                 // DON'T KNOW HOW TO CHANGE FONT/COLOUR TO THE AXIS!
  barChart4.setBarGap(25);
  barChart4.setMinValue(0);
  
  barChart5.setData(bill2y);        
  barChart5.showValueAxis(true);                
  barChart5.setBarLabels(bill2x);
  barChart5.showCategoryAxis(true);
  barChart5.transposeAxes(false);
  barChart5.setBarColour(color(#5165CE));
  barChart5.setReverseCategories(false);
  barChart5.updateLayout();                  
  barChart5.setBarGap(25);
  barChart5.setMinValue(0);
  
  barChart6.setData(bastardsy);        
  barChart6.showValueAxis(true);                // All commands needed for the bar chart on page 1
  barChart6.setBarLabels(bastardsx);
  barChart6.showCategoryAxis(true);
  barChart6.transposeAxes(false);
  barChart6.setBarColour(color(#5165CE));
  barChart6.setReverseCategories(false);
  barChart6.updateLayout();                 // DON'T KNOW HOW TO CHANGE FONT/COLOUR TO THE AXIS!
  barChart6.setBarGap(25);
  
  barChart7.setData(djangoy);        
  barChart7.showValueAxis(true);                
  barChart7.setBarLabels(djangox);
  barChart7.showCategoryAxis(true);
  barChart7.transposeAxes(false);
  barChart7.setBarColour(color(#5165CE));
  barChart7.setReverseCategories(false);
  barChart7.updateLayout();                  
  barChart7.setBarGap(25);
  
  // --------------------------------------------------------------------------------------------------------- END
  revenues = loadTable("revenues.csv", "header");
  scatterplot = new XYChart(this);
  
  // Load in data from a file 
  // (first line of file contains column headings).
 
  float[] k = new float[7];
  int h;
  for(h=0; h < 7; h = h+1) {
     k[h] = revenues.getFloat(h,1);
  }
  float[] l = new float[7];
  int u;
  for(u=0; u < 7; u = u+1) {
     l[u] = revenues.getFloat(u,2);
  }
  float[] z = new float[7];
  int t;
  for(t=0; t < 7; t = t+1) {
     z[t] = revenues.getFloat(t,3);
  }

  scatterplot.setData(l,k);
  
  // Axis formatting and labels.
  scatterplot.showXAxis(true); 
  scatterplot.showYAxis(true); 
  scatterplot.setXAxisLabel("\nBox Office Revenues (millions)");
  scatterplot.setYAxisLabel("Swearing and Violence Occurrences\n");
 
  // Symbol styles
  scatterplot.setPointColour(color(#2842CE));
  scatterplot.setPointSize(z, 60);
} 
 
// Divided in three parts depending on the page (0,1,2) 
void draw() {
  update(mouseX, mouseY, rectX, rectY);
  background(0);
 
 if (page == 0) {                            // First page with pattern graph
 fill(255,40);
 noStroke();
 for (int i = 0; i < 431; i++) {
   stroke(255);
   line(10+dogs.getFloat(i,0)*10, 130, 10+dogs.getFloat(i,0)*10, 160);            // Draws the pattern lines
   };
   
  for (int i = 0; i < 476; i++) {
   stroke(255);
   line(10+pulp.getFloat(i,0)*10, 161, 10+pulp.getFloat(i,0)*10, 191);           // Draws the pattern lines
   };
   
  for (int i = 0; i < 372; i++) {
   stroke(255);
   line(10+brown.getFloat(i,0)*10, 192, 10+brown.getFloat(i,0)*10, 222);           // Draws the pattern lines
   };
    
  for (int i = 0; i < 120; i++) {
   stroke(255);
   line(10+bill1.getFloat(i,0)*10, 223, 10+bill1.getFloat(i,0)*10, 253);          // Draws the pattern lines
   };
   
  for (int i = 0; i < 80; i++) {
   stroke(255);
   line(10+bill2.getFloat(i,0)*10, 254, 10+bill2.getFloat(i,0)*10, 284);            // Draws the pattern lines
   }; 
   
  for (int i = 0; i < 106; i++) {
   stroke(255);
   line(10+bastards.getFloat(i,0)*10, 285, 10+bastards.getFloat(i,0)*10, 315);          // Draws the pattern lines
   };
  
   
  for (int i = 0; i < 309; i++) {
   stroke(255);
   line(10+django.getFloat(i,0)*10, 316, 10+django.getFloat(i,0)*10, 346);               // Draws the pattern lines
   };
   
   stroke(255);
   line(10, 100, 1010, 100);                     // Draws the axis on page 0
   
  textFont(f1, 14);
  fill(255);
   
   for (int i = 0; i < 11; i++) {                             // Draws the nothes on the axis on page 0
     line(10+(100*i),98,10+(100*i),102);  
      text(10*i,10+(100*i)-6,95);
   };
   
   if (rectOver) {            // If the button is selected, it is colored by another hue
    fill(rectHighlight);
   } else {
    fill(rectColor);
  }
  stroke(255);
  rect(rectX, rectY, rectWidth, rectHeight);              // Draws the button on page 0
  
 textFont(f2, 25);
 fill(255);
 text("Reservoir Dogs",1040,149);                    // Print the labels for page 0
 text("Pulp Fiction",1040,180);
 text("Jackie Brown",1040,211);
 text("Kill Bill: Vol.1",1040,242);
 text("Kill Bill: Vol.2",1040,273);
 text("Inglorious Basterds",1040,304);
 text("Django Unchained",1040,335);
 text("Percentile",1040,100);
 textFont(f1, 16);
 text("Next", 584, 466);
 
 textFont(f, 28);
 text("Tarantino's Violence & Swear Pattern", 350, 30); // Title for page 0
 
 // ------------------------------------------------------------------------------------------- Second page is called if "page == 1"
 } else  if (page == 1) {      // Second page with bar chart

  switch (val) {
  case 1:
   background(#FFFFFF);
   textFont(f, 28);
   fill(#030202); 
   text("Cursing in Reservoir Dogs", 380, 50);
   textFont(f1, 15);
   barChart1.draw(15,15,width-30,height-30);
   update2(mouseX, mouseY, rectX2, rectY2);
   update3(mouseX, mouseY, rectX3, rectY3);
   
    if (rectOver2) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX2, rectY2, rectWidth2, rectHeight); 
    
    if (rectOver3) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX3, rectY3, rectWidth, rectHeight);
    
    
   fill(#030202);
   textFont(f1, 16);
   text("By Movie", 1104, 86);
   text("Back", 1104, 116);
   
  break;
  case 2:
   background(#FFFFFF);
   textFont(f, 28);
   fill(#030202); 
   text("Cursing in Pulp Fiction", 380, 50);
   textFont(f1, 15);
   barChart2.draw(15,15,width-30,height-30);
   update2(mouseX, mouseY, rectX2, rectY2);
   update3(mouseX, mouseY, rectX3, rectY3);
   
    if (rectOver2) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX2, rectY2, rectWidth2, rectHeight); 
    
    if (rectOver3) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX3, rectY3, rectWidth, rectHeight);
    
    fill(#030202);
    textFont(f1, 16);
    text("By Movie", 1104, 86);
    text("Back", 1104, 116);
  break;
  
  case 3:
   background(#FFFFFF);
   textFont(f, 28);
   fill(#030202); 
   text("Cursing in Jackie Brown", 380, 50);
   textFont(f1, 15);
   barChart3.draw(15,15,width-30,height-30);
   update2(mouseX, mouseY, rectX2, rectY2);
    update3(mouseX, mouseY, rectX3, rectY3);
   
    if (rectOver2) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX2, rectY2, rectWidth2, rectHeight); 
    
    if (rectOver3) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX3, rectY3, rectWidth, rectHeight);
    
    fill(#030202);
    textFont(f1, 16);
    text("By Movie", 1104, 86);
    text("Back", 1104, 116);
  break; 
   
  case 4:
   background(#FFFFFF);
   textFont(f, 28);
   fill(#030202); 
   text("Cursing in Kill Bill: Vol. 1", 380, 50);
   textFont(f1, 15);
   barChart4.draw(15,15,width-30,height-30);
   update2(mouseX, mouseY, rectX2, rectY2);
   update3(mouseX, mouseY, rectX3, rectY3);
   
    if (rectOver2) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX2, rectY2, rectWidth2, rectHeight); 
    
    if (rectOver3) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX3, rectY3, rectWidth, rectHeight);
    
    fill(#030202);
    textFont(f1, 16);
    text("By Movie", 1104, 86);
    text("Back", 1104, 116);
  break;
   
  case 5:
   background(#FFFFFF);
   textFont(f, 28);
   fill(#030202); 
   text("Cursing in Kill Bill: Vol. 2", 380, 50);
   textFont(f1, 15);
   barChart5.draw(15,15,width-30,height-30);
   update2(mouseX, mouseY, rectX2, rectY2);
    update3(mouseX, mouseY, rectX3, rectY3);
   
    if (rectOver2) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX2, rectY2, rectWidth2, rectHeight); 
    
    if (rectOver3) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX3, rectY3, rectWidth, rectHeight);
    
    fill(#030202);
    textFont(f1, 16);
    text("By Movie", 1104, 86);
    text("Back", 1104, 116);
  break;
  
  case 6:
   background(#FFFFFF);
   textFont(f, 28);
   fill(#030202); 
   text("Cursing in Inglorious Basterds", 380, 50);
   textFont(f1, 15);
   barChart6.draw(15,15,width-30,height-30);
   update2(mouseX, mouseY, rectX2, rectY2);
 update3(mouseX, mouseY, rectX3, rectY3);
   
    if (rectOver2) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX2, rectY2, rectWidth2, rectHeight); 
    
    if (rectOver3) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX3, rectY3, rectWidth, rectHeight);
    
    fill(#030202);
    textFont(f1, 16);
    text("By Movie", 1104, 86);
    text("Back", 1104, 116);
  break;
 
  case 7:
   background(#FFFFFF);
   textFont(f, 28);
   fill(#030202); 
   text("Cursing in Django Unchained", 380, 50);
   textFont(f1, 15);
   barChart7.draw(15,15,width-30,height-30);
   update2(mouseX, mouseY, rectX2, rectY2);
    update3(mouseX, mouseY, rectX3, rectY3);
   
    if (rectOver2) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX2, rectY2, rectWidth2, rectHeight); 
    
    if (rectOver3) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX3, rectY3, rectWidth, rectHeight);
    
    fill(#030202);
    textFont(f1, 16);
    text("All", 1128, 86);
    text("Back", 1104, 116);
  break;
  
  case 8:
   val = 0;
  break;
   
  default:
     background(#FFFFFF);
   textFont(f, 28);
   fill(#030202); 
   text("Tarantino's most common swearwords", 380, 50);
   textFont(f1, 15);
   barChart.draw(15,15,width-30,height-30);  // Draws the bar chart
 
   textFont(f1, 20);
   text("In English usage:", 800, 150);
   textFont(f1, 15);
   text("1. Shit", 800, 180);
   text("2. Fuck", 800, 200);
   text("3. Damn", 800, 220);
   text("4. Bitch", 800, 240);
   text("5. Crap", 870, 180);
   text("6. Piss", 870, 200);
   text("7. Dick", 870, 220);
   text("8. Darn", 870, 240);
 
   if (rectOver) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
   stroke(#030202);
   rect(rectX, rectY, rectWidth, rectHeight);           // Defines the button
 
   fill(#030202);
   textFont(f1, 16);
   text("Next", 1104, 46);
   
   update2(mouseX, mouseY, rectX2, rectY2);
   
    if (rectOver2) {                    // If the button is selected, it is colored by another hue
     fill(#304CFA);
   } else {
     fill(#FFFFFF);
   }
    rect(rectX2, rectY2, rectWidth2, rectHeight); 
    fill(#030202);
    text("By Movie", 1104, 86);
 }
  
  
  
 
 // ------------------------------------------------------------------------------------------- Third page is called if "page == 2"
 } else {          // Third page with *******something else*******
  background(255);
  textFont(f, 28);
  fill(#030202); 
  text("Do violence and profanity make a blockbuster?", 150, 30);
  textFont(f1, 17);
  scatterplot.draw(25,60,width-100,height-100);
   if (rectOver) {                     // If the button is selected, it is colored by another hue
   fill(#304CFA);
 } else {
   fill(#FFFFFF);
 }
 stroke(#030202);
 rect(rectX, rectY, rectWidth, rectHeight);         // Defines the button
 
 fill(#030202);
 textFont(f1, 16);
 text("Next", 1104, 486);
 }
}


void mousePressed() {                 // Updates the page index and the coordinates of the regtangles for the three buttons
  if (rectOver) {
    if(page == 0){
     page = 1;
     rectX = 1100;
     rectY = 30;
    } else if (page == 1) {
     page = 2;
     rectX = 1100;
     rectY = 470;
    } else {
     page = 0;
     rectX = 580;
     rectY = 450;
    }
 } else if (rectOver2){
     val = val + 1;
 } else if(rectOver3){
    val = val - 1;
 }
}

void update(int x, int y, int xpos, int ypos) {                                       // Updates (it's called at the start of "draw") the boolean for the mouse. I.e. Is the mouse inside the rectangle? (T/F)
 if (overRect(xpos, ypos, rectWidth, rectHeight, page) ) {
    rectOver = true;
  } else {
    rectOver = false;
  }
}

void update2(int x, int y, int xpos, int ypos) {                                       // Updates (it's called at the start of "draw") the boolean for the mouse. I.e. Is the mouse inside the rectangle? (T/F)
 if (overRect(xpos, ypos, rectWidth2, rectHeight, page) ) {
    rectOver2 = true;
  } else {
    rectOver2 = false;
  }
}

void update3(int x, int y, int xpos, int ypos) {                                       // Updates (it's called at the start of "draw") the boolean for the mouse. I.e. Is the mouse inside the rectangle? (T/F)
 if (overRect(xpos, ypos, rectWidth2, rectHeight, page) ) {
    rectOver3 = true;
  } else {
    rectOver3 = false;
  }
}





boolean overRect(int x, int y, int width, int height, int p)  {          // Calculates if the mouse is inside the rectangle or not.
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
     return false;
  }
}