// Brodden Spendlove | 9/21/26 | Calculator

String op = "";
boolean left = true;
float l = 0, r = 0, result = 0;
String displayValue = "0";
Button[] numButtons = new Button[11];
Button[] opButtons = new Button[11];
ArrayList<Button> buttons = new ArrayList<Button>();

void setup() {
  size(310, 210);

  buttons.add(new Button(30, 65, 35, 28, "7", true));
  buttons.add(new Button(71, 65, 35, 28, "8", true));
  buttons.add(new Button(112, 65, 35, 28, "9", true));
  buttons.add(new Button(153, 65, 35, 28, "C", false));
  buttons.add(new Button(30, 98, 35, 28, "4", true));
  buttons.add(new Button(71, 98, 35, 28, "5", true));
  buttons.add(new Button(112, 98, 35, 28, "6", true));
  buttons.add(new Button(153, 98, 35, 28, "CE", false));
  buttons.add(new Button(30, 131, 35, 28, "1", true));
  buttons.add(new Button(71, 131, 35, 28, "2", true));
  buttons.add(new Button(112, 131, 35, 28, "3", true));
  buttons.add(new Button(153, 131, 35, 28, "=", false));
  buttons.add(new Button(30, 164, 35, 28, "0", true));
  buttons.add(new Button(71, 164, 35, 28, ".", true));
  buttons.add(new Button(112, 164, 35, 28, "+/-", false));
  buttons.add(new Button(153, 164, 35, 28, "√", false));
  buttons.add(new Button(200, 20, 40, 22, "%", false));
  buttons.add(new Button(200, 47, 40, 22, "x²", false));
  buttons.add(new Button(250, 20, 40, 38, "÷", false));
  buttons.add(new Button(250, 63, 40, 38, "×", false));
  buttons.add(new Button(250, 106, 40, 38, "−", false));
  buttons.add(new Button(250, 149, 40, 43, "+", false));
}

void draw() {
  background(#27233A);


  fill(#EAEFD3);
  stroke(#505168);
  strokeWeight(2);
  rect(30, 20, 158, 35);

  fill(#27233A);
  textSize(16);
  textAlign(RIGHT, CENTER);
  text(displayValue, 183, 37);


  for (Button b : buttons) {
    b.draw();
  }
}

void mousePressed() {
  for (Button b : buttons) {
    if (b.contains(mouseX, mouseY)) {

      if (b.isNum) {
        if (left) {
          displayValue = (displayValue.equals("0") || (l == 0 && op.length() > 0)) ? b.label : displayValue + b.label;
          l = float(displayValue);
        } else {
          displayValue = (r == 0) ? b.label : displayValue + b.label;
          r = float(displayValue);
        }
      } else {
        String lbl = b.label;

        if (lbl.equals("+") || lbl.equals("−") || lbl.equals("×") || lbl.equals("÷") || lbl.equals("%")) {
          op = lbl;
          left = false;
          displayValue = "0";
        } else if (lbl.equals("=")) {
          performCalculation();
        } else if (lbl.equals("C")) {
          op = "";
          left = true;
          l = 0;
          r = 0;
          result = 0;
          displayValue = "0";
        } else if (lbl.equals("CE")) {
          if (left) {
            l = 0;
          } else {
            r = 0;
          }
          displayValue = "0";
        } else if (lbl.equals("+/-")) {
          if (left) {
            l = -l;
            displayValue = str(l);
          } else {
            r = -r;
            displayValue = str(r);
          }
        } else if (lbl.equals("√")) {
          float val = left ? l : r;
          result = (val < 0) ? 0 : sqrt(val);
          displayValue = (val < 0) ? "Error" : str(result);
          l = result;
          left = true;
          op = "";
        } else if (lbl.equals("x²")) {
          float val = left ? l : r;
          result = val * val;
          displayValue = str(result);
          l = result;
          left = true;
          op = "";
        }
      }

      println("Clicked: [" + b.label + "] | Active Side: " + (left ? "Left" : "Right") +
        " | l: " + l + " | op: '" + op + "' | r: " + r + " | result: " + result);
      break;
    }
  }
}

void performCalculation() {
  if (op.equals("+")) result = l + r;
  else if (op.equals("−")) result = l - r;
  else if (op.equals("×")) result = l * r;
  else if (op.equals("÷")) {
    if (r == 0) {
      displayValue = "Error: Div by 0";
      return;
    }
    result = l / r;
  } else if (op.equals("%")) {
    if (r == 0) {
      displayValue = "Error: Div by 0";
      return;
    }
    result = l % r;
  }

  displayValue = str(result);
  l = result;
  r = 0;
  op = "";
  left = true;
}
