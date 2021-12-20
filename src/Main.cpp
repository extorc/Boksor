#include <iostream>
#include "GLFW/glfw3.h"
#include "Window.h"

int main(){
  Window window;
  window.CreateWindow(800,450,"Boksor");

  while(window.OnClose()){
    window.Update();
    window.Render();
  }
}