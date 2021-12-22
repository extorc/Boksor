#include "glad/glad.h"
#include <iostream>

void PrepareRender(){
  float pos[] = {
    1,1,0.1,
    -1,1,0.1,
    -1,-1,0.1,
    1,1,0.1,
    -1,-1,0.1,
    1,-1,0.1
  };

  uint32_t buffer;
  glGenBuffers(1, &buffer);
  glBindBuffer(GL_ARRAY_BUFFER, buffer);
  glBufferData(GL_ARRAY_BUFFER, 18*sizeof(float), pos, GL_STATIC_DRAW);

  glEnableVertexAttribArray(0);
  glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3*sizeof(float), 0);
}

void Render(){
  glDrawArrays(GL_TRIANGLES, 0, 6);
}