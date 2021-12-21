#pragma once
#include "glad/glad.h"
#include <iostream>

class Shader {
public:
    Shader(const char* fSource);
    unsigned int CreateShader(const char* source, unsigned int type);
    static std::string parseFile(std::string path);

    static void Set4F(unsigned int program, const char* variable, float v0, float v1, float v2, float v3)
    {
        glUniform4f(glGetUniformLocation(program, variable), v0, v1, v2, v3);
    }
    static void Set1i(unsigned int program, const char* variable, int v0)
    {
        glUniform1i(glGetUniformLocation(program, variable), v0);
    }

private:
    unsigned int program;
};