.PHONY: init login preview new publish publish-all pull version help

# Initialization
init:
	npx qiita init

# Login to Qiita
login:
	npm install @qiita/qiita-cli@latest
	npx qiita login

# Start local preview server
preview:
	npx qiita preview

# Support passing positional arguments to make commands
ifeq ($(firstword $(MAKECMDGOALS)),$(filter $(firstword $(MAKECMDGOALS)),new publish))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

# Create a new article (Usage: make new "article_basename")
new:
	@if [ -z "$(RUN_ARGS)" ]; then \
		echo "Error: article name is required. Usage: make new \"article_basename\""; \
		exit 1; \
	fi
	npm install @qiita/qiita-cli@latest
	npx qiita new "$(RUN_ARGS)"

# Publish a specific article (Usage: make publish "article_basename")
publish:
	@if [ -z "$(RUN_ARGS)" ]; then \
		echo "Error: article name is required. Usage: make publish \"article_basename\""; \
		exit 1; \
	fi
	npm install @qiita/qiita-cli@latest
	npx qiita publish "$(RUN_ARGS)"

# Publish all articles
publish-all:
	npx qiita publish --all

# Pull articles from Qiita
pull:
	npm install @qiita/qiita-cli@latest
	npx qiita pull

# Show version
version:
	npx qiita version

# Show help
help:
	npx qiita help
