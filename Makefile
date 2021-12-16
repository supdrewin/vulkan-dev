# top level makefile by supdrewin

override JOBS            = $(shell nproc)
override workspaceFolder = $(shell pwd)

build_dir     = $(workspaceFolder)/build
makefile_dir  = $(workspaceFolder)/tools
submodule_dir = $(workspaceFolder)/third_party

include $(makefile_dir)/check_cmake.mk
include $(makefile_dir)/glfw.mk
include $(makefile_dir)/swiftshader.mk

build:     build/glfw     build/swiftshader
clean:     clean/glfw     clean/swiftshader
install:   install/glfw   install/swiftshader
prepare:   prepare/glfw   prepare/swiftshader
uninstall: uninstall/glfw uninstall/swiftshader
