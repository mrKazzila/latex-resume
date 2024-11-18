#!/usr/bin/env just --justfile

# ===== Base variables =====
DC_CMD := "docker-compose -p latex_resume -f docker/docker-compose.yml"


help:
	@echo "Available commands:"
	@echo "  just build         - Build the latex Docker container"
	@echo "  just rebuild       - Rebuild all Docker containers"
	@echo "  just run           - Run the latex Docker container"
	@echo "  just run-format    - Run the latex Docker container with formatting"
	@echo "  just run-linter    - Run the chktex(linter) Docker container"
	@echo "  just remove-bak    - Remove all .bak and .log files from /resume folder"


# ===== Docker automation =====
build:
	@echo "[j] Build the latex Docker container..."
	@{{DC_CMD}} up -d --build
	@echo "[j] Successful build!"

run:
    @echo "[j] Run the latex Docker container..."
    @{{DC_CMD}} run -d --rm latex
    @echo "[j] Done!"

run-format:
    @echo "[j] Run the latex Docker container with formatting..."
    @{{DC_CMD}} run -d --rm latex bash -c "\
        find /data -name '*.tex' -exec latexindent -w {} + && \
        -exec pdflatex -output-directory=/output main.tex"
    @echo "[j] Done!"

run-linter:
    @echo "[j] Run the chktex(linter for .tex files) Docker container..."
    @{{DC_CMD}} run -d --rm chktex bash -c "\
      chktex -v /data/main.tex > /output/chktex_output.log 2>&1 && \
      echo 'chktex completed. Check /output/chktex_output.log for details.'"
    @echo "[j] Done! Check /output/chktex_output.log for details."

rebuild:
	@echo "[j] Rebuild all Docker containers..."
	@{{DC_CMD}} up -d --build --force-recreate
	@echo "[j] Rebuild complete!"


# ===== Clean project =====
remove-bak:
    @echo "[j] Remove all '.bak' and '.log' files from 'resume' folder..."
    @find ./resume -type f \( -name '*.bak*' -o -name '*.log' \) -delete
    @echo "[j] Done!"
