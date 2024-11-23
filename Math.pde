float Sign(float x){
    if(x < 0) return -1;
    return 1;
}

ArrayList<PVector> LineCircleIntersection(PVector center, float r, float m, float n){
    float a = (pow(m, 2) + 1);
    float b = (2 * m * (n - center.y) - 2 * center.x);
    float c = (pow(center.x, 2) + pow(center.y, 2) + pow(n, 2) - 2 * center.y * n - pow(r, 2));
    float Delta = (b * b - 4 * a * c);
    ArrayList<PVector> ret = new ArrayList<PVector>();
    if(abs(Delta) <= 1e-5){
        float x = (-b) / (2 * a);
        float y = m * x + n;
        ret.add(new PVector(x, y));
    } else if(Delta < 0){
    } else{
        float x = (-b + sqrt(Delta)) / (2 * a);
        float y = m * x + n;
        ret.add(new PVector(x, y));
        x = (-b - sqrt(Delta)) / (2 * a);
        y = m * x + n;
        ret.add(new PVector(x, y));
    }
    return ret;
}

float Atan2(float y, float x){
    float theta = atan2(y, x);
    if(theta < 0) theta += TWO_PI;
    return theta;
}
