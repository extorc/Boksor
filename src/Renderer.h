#include "glad/glad.h"
#include <iostream>

void PrepareRender(){
  float pos[] = {
    1,1,-1,1,-1,-1,
    1,1,-1,-1,1,-1
  };

  uint32_t buffer;
  glGenBuffers(1, &buffer);
  glBindBuffer(GL_ARRAY_BUFFER, buffer);
  glBufferData(GL_ARRAY_BUFFER, 12*sizeof(uint32_t), pos, GL_STATIC_DRAW);

  glEnableVertexAttribArray(0);
  glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, 2*sizeof(float), 0);
}

void Render(){
  glDrawArrays(GL_TRIANGLES, 0, 6);
}