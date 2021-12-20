cmake_minimum_required(VERSION 3.14)

add_subdirectory(vendor/glfw)
add_subdirectory(vendor/GLAD)

project(Boksor)

set(inc 
  glfw
  GLAD
)

file(GLOB_RECURSE SRC 
  src/*.cpp
)
add_executable(${PROJECT_NAME} ${SRC})

target_include_directories(${PROJECT_NAME} PUBLIC ${inc})
target_link_libraries(${PROJECT_NAME} PUBLIC ${inc})