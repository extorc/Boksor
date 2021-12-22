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

bool hit_sphere(Sphere sphere, Ray r){
    vec3 oc = r.origin - sphere.center;
    float a = dot(r.direction,r.direction);
    float b = 2.0 * dot(oc, r.direction);
    float c = dot(oc, oc) - sphere.radius * sphere.radius;
    float discriminant = b * b - 4 * a * c;
    return discriminant > 0;
}
void main()
{
    vec3 camera_origin = vec3(0,0,2);
    vec2 st = gl_FragCoord.xy/vec2(x, y);
    Ray r = Ray(camera_origin, normalize(vec3(st.x - 0.5, st.y - 0.5, 1.0)));

    Sphere sphere = {vec3(0,0,0),0.5};

    if(hit_sphere(sphere,r)){
        FragColor = vec4(1,0,0,1);
    }
    else{
        FragColor = vec4(st.xy, 1.0,1.0);
    }
}