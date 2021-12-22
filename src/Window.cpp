#include "Window.h"

void Window::CreateWindow(int w, int h, const char* title){
  if(!glfwInit())
    std::cout<<"Failed : 01"<<std::endl;

  window = glfwCreateWindow(w, h, title, 0,0);

  glfwMakeContextCurrent(window);

  glfwSwapInterval(1);

  if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
    std::cout << "Failed to initialize GLAD" << std::endl;
}