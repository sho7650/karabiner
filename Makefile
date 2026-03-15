.PHONY: install uninstall diff backup help

SRC_DIR  := assets/complex_modifications
DEST_DIR := $(HOME)/.config/karabiner/assets/complex_modifications
BACKUP_DIR := $(HOME)/.config/karabiner/backups
JSON_FILES := $(wildcard $(SRC_DIR)/*.json)
FILE_NAMES := $(notdir $(JSON_FILES))

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

install: ## Copy JSON files to Karabiner config directory
	@mkdir -p $(DEST_DIR)
	@for f in $(JSON_FILES); do \
		cp "$$f" $(DEST_DIR)/; \
		echo "installed: $$(basename $$f)"; \
	done
	@echo "Done. $(words $(JSON_FILES)) files installed to $(DEST_DIR)"

uninstall: ## Remove installed JSON files from Karabiner config directory
	@for f in $(FILE_NAMES); do \
		if [ -f "$(DEST_DIR)/$$f" ]; then \
			rm "$(DEST_DIR)/$$f"; \
			echo "removed: $$f"; \
		else \
			echo "skipped (not found): $$f"; \
		fi; \
	done

diff: ## Show differences between repo and installed files
	@for f in $(FILE_NAMES); do \
		if [ -f "$(DEST_DIR)/$$f" ]; then \
			result=$$(diff "$(SRC_DIR)/$$f" "$(DEST_DIR)/$$f" 2>&1) || true; \
			if [ -n "$$result" ]; then \
				echo "--- $$f ---"; \
				echo "$$result"; \
				echo ""; \
			else \
				echo "$$f: identical"; \
			fi; \
		else \
			echo "$$f: not installed"; \
		fi; \
	done

backup: ## Backup current Karabiner complex_modifications with timestamp
	@if [ -d "$(DEST_DIR)" ]; then \
		timestamp=$$(date +%Y%m%d_%H%M%S); \
		dest="$(BACKUP_DIR)/complex_modifications_$$timestamp"; \
		mkdir -p "$$dest"; \
		cp $(DEST_DIR)/*.json "$$dest/" 2>/dev/null || true; \
		echo "Backed up to $$dest"; \
		ls "$$dest"; \
	else \
		echo "Nothing to backup: $(DEST_DIR) does not exist"; \
	fi
