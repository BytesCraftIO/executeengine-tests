VENV_BIN ?= python3 -m venv
VENV_DIR ?= .venv
PIP_CMD ?= pip3
TEST_PATH ?= .
TEST_EXEC ?= python -m

ifeq ($(OS), Windows_NT)
	VENV_ACTIVATE = $(VENV_DIR)/Scripts/activate
else
	VENV_ACTIVATE = $(VENV_DIR)/bin/activate
endif

$(VENV_ACTIVATE):
	test -d $(VENV_DIR) || $(VENV_BIN) $(VENV_DIR)
	$(VENV_RUN); $(PIP_CMD) install -r requirements.txt
	touch $(VENV_ACTIVATE)

venv: $(VENV_ACTIVATE)    ## Create a new (empty) virtual environment

install: venv    ## Install the requirements in the virtual environment
	$(VENV_RUN); $(PIP_CMD) install -r requirements.txt

test: venv					## Run the tests: python -m pytest
	$(VENV_RUN); $(TEST_EXEC) pytest