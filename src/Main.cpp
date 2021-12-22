#include "Window.h"
#include "Renderer.h"
#include "Shader.h"

int main(){
  Window window;
  window.CreateWindow(500,500,"Boksor");

  PrepareRender();

  std::string fragment = Shader::parseFile("C:/dev/Boksor/res/fragment.glsl");

  Shader shader(fragment.c_str());

  while(window.OnClose()){
    
    Shader::Set1f(shader.GetProgram(),"x",500);
    Shader::Set1f(shader.GetProgram(),"y",500);

    glClear(GL_COLOR_BUFFER_BIT);

    Render();

    window.Update();
    window.Render();
  }
}