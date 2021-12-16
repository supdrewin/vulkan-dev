# top level makefile by supdrewin

override SHELL           = bash

override JOBS            = $(shell nproc)
override workspaceFolder = $(shell pwd)

build_dir     = $(workspaceFolder)/build
makefile_dir  = $(workspaceFolder)/tools
submodule_dir = $(workspaceFolder)/third_party

include $(makefile_dir)/check_cmake.mk

include $(makefile_dir)/glfw.mk
include $(makefile_dir)/glm.mk
include $(makefile_dir)/swiftshader.mk
include $(makefile_dir)/vulkan_headers.mk
include $(makefile_dir)/vulkan_loader.mk

build:     build/glfw     build/glm     build/swiftshader     build/Vulkan-Headers     build/Vulkan-Loader
clean:     clean/glfw     clean/glm     clean/swiftshader     clean/Vulkan-Headers     clean/Vulkan-Loader
install:   install/glfw   install/glm   install/swiftshader   install/Vulkan-Headers   install/Vulkan-Loader
prepare:   prepare/glfw   prepare/glm   prepare/swiftshader   prepare/Vulkan-Headers   prepare/Vulkan-Loader
uninstall: uninstall/glfw uninstall/glm uninstall/swiftshader uninstall/Vulkan-Headers uninstall/Vulkan-Loader
