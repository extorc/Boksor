#version 330 core
out vec4 FragColor;  

uniform float x;
uniform float y;

void main()
{
    vec2 u_resolution = vec2(x, y);
    vec2 st = gl_FragCoord.xy/u_resolution; //normalizing
    vec3 canvas = vec3(1.0);

    canvas = mix(canvas, vec3(.7,.7,1),st.y); //sky gradiant
    FragColor = vec4(canvas,1.0);
}