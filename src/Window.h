#include "GLFW/glfw3.h"
#include <iostream>

class Window{
public:
  void CreateWindow(int w, int h, const char* title){
    if(!glfwInit())
      std::cout<<"Failed : 01"<<std::endl;

    window = glfwCreateWindow(w, h, title, 0,0);

    glfwMakeContextCurrent(window);
  }

  void Update(){glfwPollEvents();}
  void Render(){glfwSwapBuffers(window);}

  bool OnClose(){return !glfwWindowShouldClose(window);}
private:
  GLFWwindow* window;
};