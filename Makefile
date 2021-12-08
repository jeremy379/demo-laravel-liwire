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
			gh release create "$${TAG_NAME}" --title "$${TAG_NAME}"; \
			git fetch --tags origin; \
			echo "Release created on main $${BRANCH} with version $${TAG_NAME}"; \
			echo "The CHANGELOG.md will be generated in a minute, remember to pull"; \
		else \
			echo "You can only make a release from the main branch! Stopping."; \
		fi \
	fi

release-tag: ## Tag a release of main branch
	@read -p "Full release to Production - are you sure? it's not friday right ? (Y/n) " ANSWER; \
	if [[ $${ANSWER} == "Y" || $${ANSWER} == "y" ]]; then \
		BRANCH=$$(git branch --show-current); \
		TAG_NAME=$$(date "v+%Y.%m.%d.%H%M%S"); \
		if [[ "main" == "$${BRANCH}" ]]; then \
			git tag -a "$${TAG_NAME}" -m "Release to Production"; \
			echo "Tagged $${BRANCH} with $${TAG_NAME}, pushing..."; \
			git push --follow-tags; \
		else \
			echo "You can only make a release from the main branch! Stopping."; \
		fi \
	fi