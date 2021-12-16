# top level makefile by supdrewin

override JOBS            = $(shell nproc)
override workspaceFolder = $(shell pwd)

build_dir     = $(workspaceFolder)/build
makefile_dir  = $(workspaceFolder)/tools
submodule_dir = $(workspaceFolder)/third_party

include $(makefile_dir)/check_cmake.mk

include $(makefile_dir)/glfw.mk
include $(makefile_dir)/glm.mk
include $(makefile_dir)/swiftshader.mk

build:     build/glfw     build/glm     build/swiftshader
clean:     clean/glfw     clean/glm     clean/swiftshader
install:   install/glfw   install/glm   install/swiftshader
prepare:   prepare/glfw   prepare/glm   prepare/swiftshader
uninstall: uninstall/glfw uninstall/glm uninstall/swiftshader
