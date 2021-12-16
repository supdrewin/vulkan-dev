# check_spirv.mk - supdrewin

SPIRV_COMMAND   = $(shell command -v glslangValidator)

ifeq ($(SPIRV_COMMAND), )
  SPIRV_COMMAND = $(workspaceFolder)/bin/glslangValidator
endif

override SPIRV_COMMAND += -V
