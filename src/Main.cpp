#include "Window.h"
#include "Renderer.h"

int main(){
  Window window;
  window.CreateWindow(800,450,"Boksor");

  PrepareRender();

  while(window.OnClose()){
    glClear(GL_COLOR_BUFFER_BIT);
    glClearColor(1,0,0,1);

    Render();
    
    window.Update();
    window.Render();
  }
}