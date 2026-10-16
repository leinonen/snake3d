PORT ?= 8000
# Static site: private S3 bucket + CloudFront. Bucket, distribution and DNS live
# in github.com/leinonen/infrastructure. Pushes to main deploy via
# .github/workflows/deploy.yml.
BUCKET = snake.leinonen.ninja
DISTRIBUTION_ID = E2STWWND9CA24G

.PHONY: run open deploy
run:
	@echo "Serving http://localhost:$(PORT)"
	@python3 -m http.server $(PORT)

open:
	@xdg-open http://localhost:$(PORT) 2>/dev/null || open http://localhost:$(PORT)

deploy:
	aws s3 sync . s3://$(BUCKET) --delete --exclude "*" --include "index.html" --include "favicon*" --include "apple-touch-icon.png"
	aws cloudfront create-invalidation --distribution-id $(DISTRIBUTION_ID) --paths "/*" --no-cli-pager --query 'Invalidation.Status' --output text
