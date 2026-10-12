class Button {
  float x, y, w, h;
  String label;
  boolean isNum;
  float rot;

  Button(float x, float y, float w, float h, String label, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.isNum = isNum;
  }

  void draw() {
    pushMatrix();
    translate(x + w / 2, y + h / 2);
    rotate(rot);

    if (contains(mouseX, mouseY)) {
      fill(#DCC48E);
    } else if (isNum) {
      fill(#EAEFD3);
    } else {
      fill(#B3C0A4);
    }

    stroke(#505168);
    strokeWeight(2.5);
    rect(-w / 2, -h / 2, w, h);

    fill(#27233A);
    textAlign(CENTER, CENTER);
    textSize(18);
    text(label, 0, -2);

    popMatrix();
  }

  boolean contains(float mx, float my) {
    return (mx >= x && mx <= x + w && my >= y && my <= y + h);
  }
}
