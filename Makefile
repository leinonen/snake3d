PORT ?= 8000

.PHONY: run open
run:
	@echo "Serving http://localhost:$(PORT)"
	@python3 -m http.server $(PORT)

open:
	@xdg-open http://localhost:$(PORT) 2>/dev/null || open http://localhost:$(PORT)
