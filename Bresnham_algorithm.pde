import controlP5.*; //<>//

ControlP5 cp5;
Textarea resultOutput;
int inputWidth = 80;
int inputHeight = 40;
int offsetLeft = 20;
int offsetTop = 40;


void setup() {
  size(600, 450);
  createUI();
}

void draw() {
  background(20);
}

/**
 * Diese Funktion muss befüllt werden, um Aufgabe 2 zu lösen.
 * Nutzen Sie den vorgegebenen Code für Ihre Lösung und
 * verändern Sie ihn wo nötig.
 **/
void berechne() {

  /*==== So bekommt man Start und Endpunkt ====*/
  int xStart = Integer.parseInt(cp5.get(Textfield.class, "xStart").getText());
  int yStart = Integer.parseInt(cp5.get(Textfield.class, "yStart").getText());
  int xEnd = Integer.parseInt(cp5.get(Textfield.class, "xEnd").getText());
  int yEnd = Integer.parseInt(cp5.get(Textfield.class, "yEnd").getText());

  /*==== Berechnung Bresenham ====*/
  int dx, dy, f, stepx, stepy, sR, lR, x, y;
  String result = "("+xStart+";"+yStart+")\n";
  dx = xEnd-xStart;
  dy = yEnd-yStart;

  if (dx>0)
    stepx=1;
  else stepx=-1;

  if (dy>0)
    stepy=1;
  else stepy=-1;

  if (abs(dx)>=abs(dy)) {
    sR=dx;
    lR=dy;

    f=sR/2;
    x=xStart; 
    y=yStart;
    while (x<xEnd) {
      x=x+stepx;
      f=f-lR;
      if (f<0) {
        y=y+stepy;
        f=f+sR;
      }
      result +="(";
      result += x;
      result +=";";
      result += y;
      result += ")\n";
      resultOutput.setText(result);
    }
  } else {
    sR= dy; 
    lR= dx;
    f=sR/2;
    x=xStart; 
    y=yStart;
    while (x<xEnd) {
      y=y+stepy;
      f=f-lR;
      
      if (f<0) {
        x=x+stepx;
        f=f+sR;
      }
      result +="(";
      result += x;
      result +=";";
      result += y;
      result += ")\n";
    }
  }
}

/*==== Ausgabe des Ergebnisses im Textfeld ===*/
//resultOutput.setText(resultText);


void createUI() {
  PFont font = createFont("arial", 17);
  cp5 = new ControlP5(this);

  cp5.addTextfield("xStart")
    .setPosition(offsetLeft, offsetTop)
    .setSize(inputWidth, inputHeight)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255))
    .setInputFilter(ControlP5.INTEGER)
    .setText("0")
    .setCaptionLabel("x Start")
    ;

  cp5.addTextfield("yStart")
    .setPosition((offsetLeft * 3) + inputWidth, offsetTop)
    .setSize(inputWidth, inputHeight)
    .setFont(font)
    .setFocus(false)
    .setColor(color(255))
    .setInputFilter(ControlP5.INTEGER)
    .setText("0")
    .setCaptionLabel("y Start")
    ;

  cp5.addTextfield("xEnd")
    .setPosition(offsetLeft, (offsetTop * 3) + inputHeight)
    .setSize(inputWidth, inputHeight)
    .setFont(font)
    .setFocus(false)
    .setColor(color(255))
    .setInputFilter(ControlP5.INTEGER)
    .setText("0")
    .setCaptionLabel("x End")
    ;

  cp5.addTextfield("yEnd")
    .setPosition((offsetLeft * 3) + inputWidth, (offsetTop * 3) + inputHeight)
    .setSize(inputWidth, inputHeight)
    .setFont(font)
    .setFocus(false)
    .setColor(color(255))
    .setInputFilter(ControlP5.INTEGER)
    .setText("0")
    .setCaptionLabel("y End")
    ;

  cp5.addBang("berechne")
    .setPosition(offsetLeft, (offsetTop * 5) + (inputHeight * 2))
    .setSize(150, 50)
    .setFont(font)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
    ;

  resultOutput = cp5.addTextarea("result")
    .setPosition((offsetLeft * 5) + (inputWidth * 2), offsetTop)
    .setSize(width - ((offsetLeft * 7) + (inputWidth * 2)), height - (offsetTop*2))
    .setFont(font)
    .setLineHeight(21)
    .setColor(color(255))
    .setColorBackground(color(255, 100))
    .setColorForeground(color(255, 100));
  ;
}
