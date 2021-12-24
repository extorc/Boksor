#version 330 core

out vec4 FragColor;  
uniform float x;
uniform float y;

struct Ray{
    vec3 origin;
    vec3 direction;
};

struct Sphere{
    vec3 center;
    float radius;
};

struct Discrininant {
    float disc;
    float inc;
};

Discrininant hit_sphere(Sphere sphere, Ray r){
    vec3 oc = r.origin - sphere.center;
    float a = dot(r.direction,r.direction);
    float b = 2.0 * dot(oc, r.direction);
    float c = dot(oc, oc) - sphere.radius * sphere.radius;
    float discriminant = b * b - 4 * a * c;
    Discrininant d;

    d.disc = discriminant;
    d.inc = (-b -sqrt(discriminant))/(2.0 * a);
    return d;
}

vec3 at(Ray ray, float p){
    return ray.origin + p * ray.direction;
}

void main()
{
    vec3 camera_origin = vec3(0,0,2);
    vec2 st = gl_FragCoord.xy/vec2(x, y);
    Ray r = Ray(camera_origin, normalize(vec3(st.x - 0.5, st.y - 0.5, 1.0)));

    Sphere sphere = {vec3(0,0,0),0.5};
    Discrininant d = hit_sphere(sphere, r);
    
    if(d.disc > 0){
        vec3 N = normalize(at(r, d.inc) - sphere.center);
        FragColor = vec4(N, 1);
    }
    else{
        // FragColor = vec4(st.xy, 1.0, 1.0);
        FragColor = vec4(1 - st.y+0.7, 1 - st.y+0.7,1 - st.y+0.9, 1.0);
    }
}