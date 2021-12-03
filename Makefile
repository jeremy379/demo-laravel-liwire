.PHONY: install release
SHELL := /bin/bash

install: ## Start containers
	brew install gh
	gh auth login

uat-release: ## This is temporary, see deploy-uat.yml
	echo "Deploying to UAT..."; \
	git push --delete origin env/uat
	git tag -fa env/uat -m "Release to UAT"; \
	git push --follow-tags

testing-release: ## DEPRECATED: Please deploy to Testing using https://github.com/BePark/platform#testing
    echo "Please deploy to Testing using https://github.com/BePark/platform#testing"
	echo "Deploying to Testing..."; \
	git push --delete origin env/testing
	git tag -fa env/testing -m "Release to Testing"; \
	git push --follow-tags

release: ## Tag a release of main branch
	@read -p "Full release to Production - are you sure? (Y/n) " ANSWER; \
	if [[ $${ANSWER} == "Y" || $${ANSWER} == "y" ]]; then \
		BRANCH=$$(git branch --show-current); \
		TAG_NAME=$$(date "+%Y-%m-%dT%H.%M.%S"); \
		if [[ "main" == "$${BRANCH}" ]]; then \
			git tag -a "$${TAG_NAME}" -m "Release to Production"; \
			gh release create "$${TAG_NAME}" \
			echo "Tagged $${BRANCH} with $${TAG_NAME}, pushing..."; \
			git push --follow-tags; \
		else \
			echo "You can only make a release from the main branch! Stopping."; \
		fi \
	fi
