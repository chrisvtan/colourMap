// A concrete implementation of the CAView as simple 2-color squares.
class BestView extends CAView {

  // The color to display when the state of a CA cell is "on".
  color onColor;

  // The color to display when the state of a CA cell is "off".
  color offColor;

  // RGB color mapping of CA cell when "on"
  color red;
  color blue;
  color green;
  int yPos = 0;


  final int FINAL_IMAGE_COUNT = 4;
  // an array of png images of our faces used for random selection.
  PImage sofian;
  PImage sofianDisplayed;
  // Class constructor taking as a parameter the model referred to.
  BestView(CA model) {
    this(model, color(255), color(0));
  }

  // Class constructor taking as a parameter the model referred to as well as "on" and "off" colors.
  BestView(CA model, color onColor, color offColor) {
    super(model);
    this.onColor = onColor;
    this.offColor = offColor;
    //images = new PImage[FINAL_IMAGE_COUNT];
    //images[0] = loadImage("data/chris.png");
    //images[1] = loadImage("data/gerry.png");
    //images[2] = loadImage("data/sherman.png");
    //images[3] = loadImage("data/sophia.png");
    sofian = loadImage("data/Sofian.jpg");
    sofian.loadPixels();
    sofianDisplayed = loadImage("data/Sofian2.jpg");
    sofianDisplayed.loadPixels();
    image (sofian, 0, 0);
  }

  // Resets the view to initial conditions.
  void restart() {
    background(255); // resets background
    image(sofian, 0, 0);
    fill(0);
    rect(0, yPos, width, height);
    
  }

  // Displays the model CA as simple square cells.
  void display() {
    fill(0);
    rect(0, yPos, width, height);
    for (int i = 0; i < model.nCells(); i++) {
      yPos += model.getGeneration()*CELL_WIDTH;
      //for (int j = width*model.getGeneration(); j <height*width/CELL_WIDTH; j++) {
      //   sofianDisplayed.pixels[j]=sofian.pixels[j];
      //fill(0);
      //rect(i*CELL_WIDTH, model.getGeneration()*CELL_WIDTH, CELL_WIDTH, CELL_WIDTH);
      // }
      // sofianDisplayed.updatePixels();
      // image (sofian,0,model.getGeneration()*CELL_WIDTH);
      if (model.getCell(i) == 1) {
        red = int(map(i*CELL_WIDTH, width/2, width, 0, 255));
        blue = int(map(i*CELL_WIDTH, width/2, 0, 0, 255));
        green = int(map(model.getGeneration()*CELL_WIDTH, 0, height, 0, 255));
        colorMode(RGB, 100);

        // tint(red, green, blue);
        //int randomFace = int(random(0, 4));
        // image(sofian, 0, 0);
        //fill(0);
        //rect(0, model.getGeneration()*CELL_WIDTH, width, height);
      } else {
        noStroke();
        red = int(map(model.getGeneration()*CELL_WIDTH, 0, height, 0, 255));
        blue = int(map(i*CELL_WIDTH, width/2, width, 0, 255));
        green = int(map(i*CELL_WIDTH, width/2, 0, 0, 255));

        colorMode(RGB, 100);
        fill(red, green, blue);
        //ellipseMode(CORNER);
        rect(i*CELL_WIDTH, model.getGeneration()*CELL_WIDTH, CELL_WIDTH, CELL_WIDTH);
      }
    }
  }

  // Return true iff the CA has completed its run. This is the case if it reaches the bottom of the screen.
  boolean finished() {
    return (model.getGeneration() > height/CELL_WIDTH);
  }
}