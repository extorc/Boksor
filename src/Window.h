#pragma once

#include "glad/glad.h"
#include "GLFW/glfw3.h"
#include <iostream>

class Window{
public:
  void CreateWindow(int w, int h, const char* title);

  void Update(){glfwPollEvents();}
  void Render(){glfwSwapBuffers(window);}

  bool OnClose(){return !glfwWindowShouldClose(window);}
private:
  GLFWwindow* window;
};