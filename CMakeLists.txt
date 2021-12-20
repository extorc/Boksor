cmake_minimum_required(VERSION 3.14)

add_subdirectory(vendor/glfw)

project(Boksor)

add_executable(${PROJECT_NAME} Main.cpp)
target_include_directories(${PROJECT_NAME} PUBLIC glfw)
target_link_libraries(${PROJECT_NAME} PUBLIC glfw)