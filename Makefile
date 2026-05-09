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

# Create a new article (Usage: make new NAME=article_basename)
new:
	@if [ -z "$(NAME)" ]; then \
		echo "Error: NAME is required. Usage: make new NAME=article_basename"; \
		exit 1; \
	fi
	npm install @qiita/qiita-cli@latest
	npx qiita new $(NAME)

# Publish a specific article (Usage: make publish NAME=article_basename)
publish:
	@if [ -z "$(NAME)" ]; then \
		echo "Error: NAME is required. Usage: make publish NAME=article_basename"; \
		exit 1; \
	fi
	npm install @qiita/qiita-cli@latest
	npx qiita publish $(NAME)

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
