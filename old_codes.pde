//Circle(M, 0, M, #FFFFFF, 5);
    
/*
ArrayList<PVector> lineIntersections = LineCircleIntersection(new PVector(M, 0), M, 0, hc);
for(PVector intersection : lineIntersections){
    float theta = Atan2(intersection.y, intersection.x - M);
    if((UPPER_ANGLE <= theta && theta <= LOWER_ANGLE) || (LOWER_ANGLE <= theta && theta <= UPPER_ANGLE)){
        Point(intersection.x, intersection.y, #FF007F, 10);
        Line(dc, hc, intersection.x, intersection.y, #FF007F, 5);
        float alpha = Atan2(intersection.y, intersection.x - F) - PI;
        Line(intersection.x + cos(alpha) * 1000, intersection.y + sin(alpha) * 1000, intersection.x, intersection.y, #FF007F, 5);
    }
}


ArrayList<PVector> deneme = LineCircleIntersection(new PVector(M, 0), M, ((hc) / (dc - F)), ((F * hc) / (F - dc)));
for(PVector intersection : deneme){
    float theta = Atan2(intersection.y, intersection.x - M);
    if((UPPER_ANGLE <= theta && theta <= LOWER_ANGLE) || (LOWER_ANGLE <= theta && theta <= UPPER_ANGLE)){
        Point(intersection.x, intersection.y, #7F00FF, 10);
        Line(dc, hc, intersection.x, intersection.y, #7F00FF, 5);
        Line(intersection.x + 1000, intersection.y, intersection.x, intersection.y, #7F00FF, 5);
    }
}
*/
