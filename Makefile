.PHONY : install_dependencies install_tuist tuist_fetch tuist_generate project ci_project open_workspace

NOCOLOR=\033[0m
RED=\033[1;31m
GREEN=\033[0;32m
YELLOW=\033[1;33m
BLUE=\033[1;34m
PURPLE=\033[1;35m
CYAN=\033[0;36m

ruby?=rbenv

install_dependencies:
	make install_tuist

install_tuist:
	sudo bash -c "bash <(curl -Ls https://install.tuist.io)"
	tuist bundle

tuist_fetch:
	.tuist-bin/tuist fetch

tuist_generate:
	.tuist-bin/tuist generate --no-open

project: ci_project open_workspace

ci_project: tuist_fetch tuist_generate

open_workspace:
	xed .

# Makefile Documentation
list:
	@echo "${BLUE}This is a list of all available targets for this Makefile with explanations on how to use them."
	@echo "Please update it accordingly after modifying targets."
	@echo "${GREEN}--------------- SETUP ---------------${NOCOLOR}"
	@echo "${CYAN}list:${NOCOLOR} Lists all available targets and instructions on how to use them."
	@echo "${CYAN}install_dependencies:${NOCOLOR} Installs the project dependencies."
	@echo "${CYAN}install_tuist:${NOCOLOR} Installs Tuist."
	@echo "${CYAN}tuist_fetch:${NOCOLOR} Fetch Tuist dependencies."
	@echo "${CYAN}tuist_generate:${NOCOLOR} Tuist generate project."
	@echo "${CYAN}project:${NOCOLOR} Generates the XCode Projects and Workspace and opens it."
	@echo "${CYAN}ci_project:${NOCOLOR} Generates the XCode Projects and Workspace."
	@echo "${CYAN}open_workspace:${NOCOLOR} Open Workspace on Xcode."
