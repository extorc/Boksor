#include "Window.h"
#include "Renderer.h"
#include "Shader.h"

int main(){
  Window window;
  window.CreateWindow(800,450,"Boksor");

  PrepareRender();

  std::string fragment = Shader::parseFile("C:/dev/Boksor/res/fragment.glsl");

  Shader shader(fragment.c_str());

  while(window.OnClose()){
    glClear(GL_COLOR_BUFFER_BIT);
    glClearColor(1,0,0,1);

    Render();

    window.Update();
    window.Render();
  }
}