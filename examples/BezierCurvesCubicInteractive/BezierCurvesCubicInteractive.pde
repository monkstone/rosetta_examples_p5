/**
 * Bézier Curves Cubic (Interactive)
 * http://rosettacode.org/wiki/Bitmap/B%C3%A9zier_curves/Cubic#Processing
 * Processing 3.4
 * 2019-02-24 Noel
 *
 * Task:
 *
 * Using the data storage type for raster images and a draw_line function,
 * draw a cubic bezier curve.
 */

// A working sketch with movable anchor and control points.
// It can be run online :
// https://www.openprocessing.org/sketch/846556/

float[] x = new float[4];
float[] y = new float[4];
boolean[] permitDrag = new boolean[4];
 
void setup() {
  size(300, 300);
  smooth();
  //  startpoint coordinates
  x[0] = x[1] =  50;
	y[0] = 50;
	y[1] = y[2] = 150;
  x[2] = x[3] = 250;
  y[3] = 250;
 
}
 
void draw() {
  background(255);
  noFill();
  stroke(0, 0, 255);
  bezier (x[1], y[1], x[0], y[0], x[3], y[3], x[2], y[2]);
  // the bezier handles
  strokeWeight(1);
  stroke(100);
  line(x[0], y[0], x[1], y[1]);
  line(x[2], y[2], x[3], y[3]);
  // the anchor and control points
  stroke(0);
  fill(0);
  for (int i =0; i< 4; i++) {
    if (i ==0 || i==3) {
      fill(255, 100, 10);
      rectMode(CENTER);
      rect(x[i], y[i], 5, 5);
    } else {
      fill(0);
      ellipse(x[i], y[i], 5, 5);
    }
  }
 
  // permit dragging 
  for (int i =0; i< 4; i++) {
    if (permitDrag[i]) {
      x[i] = mouseX;
      y[i] = mouseY;
    }
  }
}
 
void mouseReleased () {
  for (int i =0; i< 4; i++) {
    permitDrag[i] = false;
  }
}
 
void mousePressed () {
  for (int i =0; i< 4; i++) {
    if (mouseX>=x[i]-5 && mouseX<=x[i]+10 && mouseY>=y[i]-5 && mouseY<=y[i]+10) {
      permitDrag[i] = true;
    }
  }
}
 
// hand curser when over dragging over points
void mouseMoved () {
  cursor(ARROW);
  for (int i =0; i< 4; i++) {
    if (mouseX>=x[i]-5 && mouseX<=x[i]+10 && mouseY>=y[i]-5 && mouseY<=y[i]+10) {
      cursor(HAND);
    }
  }
}
