include .env

.PHONY: help dc-start dc-stop dc-start-local
.DEFAULT: help

help:
	@echo "List of available commands"
	@echo "(Note that you might need to run these commands with 'sudo')"
	@echo ""
	@echo "make dc-start"
	@echo "  Start app in docker."
	@echo "make dc-stop"
	@echo "  Stop docker app."
	@echo "make dc-start-local"
	@echo "  Start docker app for local dev (w/o nginx)."

dc-stop:
	@docker-compose stop;

dc-build:
	@docker-compose build;

dc-start: dc-stop dc-build
	@docker-compose up -d;

dc-start-local: dc-stop dc-build
	@docker-compose up --scale nginx=0;
