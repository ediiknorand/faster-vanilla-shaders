#version 110

uniform sampler2D DiffuseSampler;

varying vec2 texCoord;
varying vec2 oneTexel;

const float PI = 3.14159265;
const float apperture = 240.0;

void main() {
  float appertureHalf = 0.5*apperture*(PI/180.0);
  float factor = sin(appertureHalf);

  vec4 pixel;
  vec2 dcoord = 2.0*texCoord - 1.0;
  float dist = length(dcoord);
  if(dist < 1.0) {
    float z = sqrt(1.0 - dist*dist);
    float r = atan(dist, z) / PI;
    float phi = atan(dcoord.y, dcoord.x);

    vec2 coord;
    coord.x = r * cos(phi) + 0.5;
    coord.y = r * sin(phi) + 0.5;

    pixel = texture2D(DiffuseSampler, coord*factor);
  } else {
    pixel = texture2D(DiffuseSampler, texCoord);
  }
  gl_FragColor = vec4(pixel.r, 0.7*pixel.g, 0.8*pixel.b, 1.0);
}
