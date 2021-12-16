# check_cmake.mk

override CMAKE_COMMAND = $(shell command -v cmake)

check/cmake:
	@if [ "$(CMAKE_COMMAND)" = "" ]; then echo "error: \`cmake\' not found!" && exit 1; fi
.PHONY: check/cmake
