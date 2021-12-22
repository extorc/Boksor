#version 330 core

out vec4 FragColor;  
uniform float x;
uniform float y;

struct Ray{
    vec3 origin;
    vec3 direction;
};

bool hit_sphere(vec3 center, float radius, Ray r){
    vec3 oc = r.origin - center;
    float a = dot(r.direction,r.direction);
    float b = 2.0 * dot(oc, r.direction);
    float c = dot(oc, oc) - radius * radius;
    float discriminant = b * b - 4 * a * c;
    return discriminant > 0;
}
void main()
{
    vec3 camera_origin = vec3(0,0,2);
    vec2 st = gl_FragCoord.xy/vec2(x, y);
    Ray r = Ray(camera_origin, normalize(vec3(st.x - 0.5, st.y - 0.5, 1.0)));

    if(hit_sphere(vec3(0,0,0),0.5,r)){
        FragColor = vec4(1,0,0,1);
    }
    else{
        FragColor = vec4(st.xy, 1.0,1.0);
    }
}