void Line(float x1, float y1, float x2, float y2, color clr, int weight){
    pushStyle();
    stroke(clr);
    strokeWeight(weight);
    line(HALFW + x1, HALFH - y1, HALFW + x2, HALFH - y2);
    popStyle();
}

void Point(float x, float y, color clr, int weight){
    pushStyle();
    stroke(clr);
    strokeWeight(weight);
    point(HALFW + x, HALFH - y);
    popStyle();
}

void Circle(float x, float y, float r, color clr, int weight){
    pushStyle();
    stroke(clr);
    strokeWeight(weight);
    noFill();
    circle(HALFW + x, HALFH - y, r);
    popStyle();
}

void Arc(float x, float y, float r, float start, float end, color clr, int weight){
    if(end < start) {float temp = end; end = start; start = temp;}
    pushStyle();
    stroke(clr);
    strokeWeight(weight);
    noFill();
    arc(HALFW + x, HALFH - y, r, r, TWO_PI - end, TWO_PI - start);
    popStyle();
}
