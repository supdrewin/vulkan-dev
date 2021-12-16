override JOBS            = $(shell nproc)
override workspaceFolder = $(shell pwd)

include tools/swiftshader.mk
include tools/check_cmake.mk
