int arraylengte = 100; //ballen per frame
float[] x = new float[arraylengte];
float[] y = new float[arraylengte];
float[] vy = new float[arraylengte];
color[] kleur = new color[arraylengte];
float[] diameter= new float[arraylengte];
int grensy;
int grensx;
float vmin = 1;
float vmax = 3;
float diametera = 5;
float diameterb = 10;


void setup() {
  //size(1000, 800);
  noStroke();
  fullScreen();
  noCursor();
  grensx = width;
  grensy = height;

  for (int i = 0; i < arraylengte; i++) { // i = 0,1,2.. arraylengte - 1
    diameter[i] = diameterb+diametera*vy[i]; // hoe sneller de confetti, hoe groter de diameter
    kleur[i] = color(random(0, 255), random(0, 255), random(0, 255));
    x[i] = random(0, grensx);
    y[i] = random(0, grensy);
    vy[i] = random(vmin, vmax);
  }
}

void draw() {
  background(255);

  for (int i = 0; i < arraylengte; i++) {
    y[i] += vy[i]; // confetti valt omdat y-coordinaat steeds groter wordt
    fill(kleur[i]);
    diameter[i] = diameterb+diametera*vy[i];
    ellipse(x[i], y[i], diameter[i], diameter[i]);
    if (y[i] > grensy+diameter[i]) {
      vy[i] = random(vmin, vmax);
      y[i] = -diameter[i];
      x[i] = random(0, grensx);
      kleur[i] = color(random(0, 255), random(0, 255), random(0, 255));
    }
  }
}
