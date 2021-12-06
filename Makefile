.PHONY: install release
SHELL := /bin/bash

default:
	@IFS=$$'\n' ; \
	echo "make install or make release";

install: ## Start containers
	brew install gh
	gh auth login

release: ## Tag a release of main branch
	@read -p "Full release to Production - are you sure? (Y/n) " ANSWER; \
	if [[ $${ANSWER} == "Y" || $${ANSWER} == "y" ]]; then \
		BRANCH=$$(git branch --show-current); \
		TAG_NAME=$$(date "+%Y-%m-%dT%H.%M.%S"); \
		if [[ "main" == "$${BRANCH}" ]]; then \
			gh release create "$${TAG_NAME}"; \
			echo "Release created on main $${BRANCH} with version $${TAG_NAME}"; \
		else \
			echo "You can only make a release from the main branch! Stopping."; \
		fi \
	fi
