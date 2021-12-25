#version 330 core

out vec4 FragColor;  
uniform float x;
uniform float y;

//Data structures
struct Ray{
    vec3 origin;
    vec3 direction;
};

struct Sphere{
    vec3 center;
    float radius;
};

struct hit_record{
    vec3 p;
    vec3 normal;
    float t;
};

//generate vec3 to intersection point for a given distance and ray
vec3 at(Ray ray, float p){
    return ray.origin + p * ray.direction;
}

bool hit_sphere(Sphere sphere, Ray r, out hit_record rec){
    vec3 oc = r.origin - sphere.center;
    float a = dot(r.direction,r.direction);
    float b = 2.0 * dot(oc, r.direction);
    float c = dot(oc, oc) - sphere.radius * sphere.radius;
    float discriminant = b * b - 4 * a * c;
    if (discriminant < 0) return false;

    float root = (-b -sqrt(discriminant))/(2.0 * a);
    rec.t = root;
    rec.p = at(r, rec.t);
    rec.normal = (rec.p-sphere.center)/sphere.radius;
    return true;
}

void main()
{
    vec3 camera_origin = vec3(0,0,2);
    vec2 st = gl_FragCoord.xy/vec2(x, y);
    Ray r = Ray(camera_origin, normalize(vec3(st.x - 0.5, st.y - 0.5, 1.0)));

    Sphere sphere = {vec3(0,0,0),0.5};
    hit_record rec;
    
    if(hit_sphere(sphere,r,rec)){
        FragColor = vec4(rec.normal, 1);
    }
    else{
        FragColor = vec4(1 - st.y+0.7, 1 - st.y+0.7,1 - st.y+0.9, 1.0);
    }
}