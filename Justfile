#!/usr/bin/env just --justfile

# ===== Base variables =====
PROJECT_NAME := "latex_resume"
DC := "docker-compose"
DC_FILE := "docker/docker-compose.yml"


help:
	@echo "Available commands:"
	@echo "  just build        - Build the latex Docker container"
	@echo "  just run          - Run the latex Docker container"
	@echo "  just run_format   - Run the latex Docker container with formatting"
	@echo "  just run_linter   - Run the chktex(linter) Docker container"
	@echo "  just rebuild      - Rebuild all Docker containers"


# ===== Docker automation =====
build:
	@echo "[j] Build the latex Docker container..."
	{{DC}} -p {{PROJECT_NAME}} -f {{DC_FILE}} up -d --build
	@echo "[j] Successful build!"

run:
    @echo "[j] Run the latex Docker container..."
    {{DC}} -p {{PROJECT_NAME}} -f {{DC_FILE}} run -d --rm latex
    @echo "[j] Done!"

run_format:
    @echo "[j] Run the latex Docker container with formatting..."
    {{DC}} -p {{PROJECT_NAME}} -f {{DC_FILE}} run -d --rm latex bash -c "\
        find /data -name '*.tex' -exec latexindent -w -no-backup {} + && \
        find /data -name '*.tex' -exec pdflatex -output-directory=/output {} +"
    @echo "[j] Done!"

run_linter:
    @echo "[j] Run the chktex(linter for .tex files) Docker container..."
    -{{DC}} -p {{PROJECT_NAME}} -f {{DC_FILE}} run -d --rm chktex bash -c "\
      chktex -v /data/main.tex > /output/chktex_output.log 2>&1 && \
      echo 'chktex completed. Check /output/chktex_output.log for details.'"
    @echo "[j] Done! Check /output/chktex_output.log for details."

rebuild:
	@echo "[m] Rebuild all Docker containers..."
	{{DC}} -p {{PROJECT_NAME}} -f {{DC_FILE}} up -d --build --force-recreate
	@echo "[m] Rebuild complete!"
