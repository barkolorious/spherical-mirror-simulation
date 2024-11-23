int WIDTH = 1920, HEIGHT = 1080;
int HALFW = WIDTH / 2, HALFH = HEIGHT / 2;
float dc, dg, hc, hg, F = 150, M = F * 2;
float UPPER_ANGLE = HALF_PI + QUARTER_PI, LOWER_ANGLE = PI + QUARTER_PI;
PVector Mouse;

int getMouseX(){
    int x = mouseX;
    x -= HALFW;
    return x;
}

int getMouseY(){
    int y = mouseY;
    y -= HALFH;
    return -y;
}

void mouseDragged(){
    float distToFocus = dist(F, 0, Mouse.x, Mouse.y);
    float distToObject = dist(dc, hc, Mouse.x, Mouse.y);
    float distToUpperAngle = dist(M + M * cos(UPPER_ANGLE), M * sin(UPPER_ANGLE), Mouse.x, Mouse.y);
    float distToLowerAngle = dist(M + M * cos(LOWER_ANGLE), M * sin(LOWER_ANGLE), Mouse.x, Mouse.y);
    
    float min = min(distToFocus, min(distToObject, min(distToUpperAngle, distToLowerAngle)));
    
    if(min > 30) return;
    
    if(distToFocus == min){
        F = Mouse.x;
        M = 2 * F;
    } else if(distToObject == min){
        dc = Mouse.x;
        hc = Mouse.y;
    } else if(distToUpperAngle == min){
        UPPER_ANGLE = Atan2(Mouse.y, Mouse.x - M);
    } else if(distToLowerAngle == min){
        LOWER_ANGLE = Atan2(Mouse.y, Mouse.x - M);
    }
}

void setup(){
    size(1920, 1080);
    background(0);
    ellipseMode(RADIUS);
    
    Mouse = new PVector();
    dc = F;
    hc = 50;
}

void draw(){
    background(0);
    Mouse.set(getMouseX(), getMouseY());
    //dc = Mouse.x;
    //hc = Mouse.y;
    
    Point(M + M * cos(UPPER_ANGLE), M * sin(UPPER_ANGLE), #FFFFFF, 15);
    Point(M + M * cos(LOWER_ANGLE), M * sin(LOWER_ANGLE), #FFFFFF, 15);
    
    if(Sign(hc) != Sign(hg)){
        // Paralel
        Point(0, hc, #FF007F, 10);
        Line(dc, hc, 0, hc, #FF007F, 5); //  incoming
        float alpha = Atan2(hc, -F) - PI;
        Line(cos(alpha) * 10000, hc + sin(alpha) * 10000, 0, hc, #FF007F, 5); // reflected
        
        // Odak
        Point(0, ((F * hc) / (F - dc)), #7F00FF, 10);
        Line(dc, hc, 0, ((F * hc) / (F - dc)), #7F00FF, 5); //  incoming
        Line(10000, ((F * hc) / (F - dc)), 0, ((F * hc) / (F - dc)), #7F00FF, 5); // reflected
        
        // Tepe
        Point(0, 0, #007FFF, 10);
        Line(dc, hc, 0, 0, #007FFF, 5); //  incoming
        alpha = -(Atan2(hc, dc));
        Line(cos(alpha) * 10000, sin(alpha) * 10000, 0, 0, #007FFF, 5); // reflected
        
        Arc(M, 0, M, UPPER_ANGLE, LOWER_ANGLE, #FFFFFF, 5); // Mirror
        Line(dc, 0, dc, hc, #FFFFFF, 5); // Object
        dg = (F * dc) / (dc - F);
        hg = (-hc * dg) / dc;
        Line(dg, 0, dg, hg, #FFFF7F, 5); // Reflection
    }else{
        if(dc > 0){
            // Paralel
            Point(0, hc, #FF007F, 10);
            Line(dc, hc, 0, hc, #FF007F, 5); //  incoming
            float alpha = Atan2(hc, -F) - PI;
            Line(cos(alpha) * 10000, hc + sin(alpha) * 10000, 0, hc, #FF007F, 5); // reflected
            Line(-cos(alpha) * 10000, hc - sin(alpha) * 10000, 0, hc, color(#FF007F, 128), 5); // reflected uzantısı
            
            // Odak
            Point(0, ((F * hc) / (F - dc)), #7F00FF, 10);
            Line(dc, hc, 0, ((F * hc) / (F - dc)), #7F00FF, 5); //  incoming
            Line(10000, ((F * hc) / (F - dc)), 0, ((F * hc) / (F - dc)), #7F00FF, 5); // reflected
            Line(-10000, ((F * hc) / (F - dc)), 0, ((F * hc) / (F - dc)), color(#7F00FF, 128), 5); // reflected uzantısı
            
            // Tepe
            Point(0, 0, #007FFF, 10);
            Line(dc, hc, 0, 0, #007FFF, 5); //  incoming
            alpha = -(Atan2(hc, dc));
            Line(cos(alpha) * 10000, sin(alpha) * 10000, 0, 0, #007FFF, 5); // reflected
            Line(-cos(alpha) * 10000, -sin(alpha) * 10000, 0, 0, color(#007FFF, 128), 5); // reflected uzantısı
        }else{
            // Paralel
            Point(0, hc, #FF007F, 10);
            Line(dc, hc, 0, hc, #FF007F, 5); //  incoming
            float alpha = Atan2(hc, -F) - PI;
            Line(cos(alpha) * 10000, hc + sin(alpha) * 10000, 0, hc, color(#FF007F, 128), 5); // reflected uzantısı
            Line(-cos(alpha) * 10000, hc - sin(alpha) * 10000, 0, hc, #FF007F, 5); // reflected
            
            // Odak
            Point(0, ((F * hc) / (F - dc)), #7F00FF, 10);
            Line(dc, hc, 0, ((F * hc) / (F - dc)), #7F00FF, 5); //  incoming
            Line(10000, ((F * hc) / (F - dc)), 0, ((F * hc) / (F - dc)), color(#7F00FF, 128), 5); // reflected uzantısı
            Line(-10000, ((F * hc) / (F - dc)), 0, ((F * hc) / (F - dc)), #7F00FF, 5); // reflected
            
            // Tepe
            Point(0, 0, #007FFF, 10);
            Line(dc, hc, 0, 0, #007FFF, 5); //  incoming
            alpha = -(Atan2(hc, dc));
            Line(cos(alpha) * 10000, sin(alpha) * 10000, 0, 0, #007FFF, 5); // reflected uzantısı
            Line(-cos(alpha) * 10000, -sin(alpha) * 10000, 0, 0, color(#007FFF, 128), 5); // reflected
        }
        Arc(M, 0, M, UPPER_ANGLE, LOWER_ANGLE, #FFFFFF, 5); // Mirror
        Line(dc, 0, dc, hc, #FFFFFF, 5); // Object
        dg = (F * dc) / (dc - F);
        hg = (-hc * dg) / dc;
        Line(dg, 0, dg, hg, color(#FFFF7F, 128), 5); // Reflection
    }
    
    Line(0, 1000, 0, -1000, color(#FFFFFF, 128), 5);
    Line(1000, 0, -1000, 0, color(#FFFFFF, 128), 5);
    Point(3 * F, 0, color(#00FF00, 128), 15);
    Point(M, 0, #FF0000, 15);
    Point(F, 0, #00FF00, 15);
    Point(0, 0, #FFFFFF, 15);
    Point(dc, hc, #FFFFFF, 15);
}
