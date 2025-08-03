.PHONY: help clean build install install-dev test lint format check-format dist upload upload-test

help:
	@echo "Available commands:"
	@echo "  install       Install the package"
	@echo "  install-dev   Install the package in development mode with dev dependencies"
	@echo "  build         Build the package"
	@echo "  clean         Clean build artifacts"
	@echo "  test          Run tests"
	@echo "  lint          Run linting"
	@echo "  format        Format code with black"
	@echo "  check-format  Check if code is formatted"
	@echo "  dist          Build distribution packages"
	@echo "  upload-test   Upload to TestPyPI"
	@echo "  upload        Upload to PyPI"

clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	rm -rf .pytest_cache/
	rm -rf .coverage
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

build:
	python -m build

install:
	pip install .

install-dev:
	pip install -e ".[dev]"

test:
	python -m pytest

lint:
	python -m flake8 src/main/python/fobis/
	python -m mypy src/main/python/fobis/

format:
	python -m black src/main/python/fobis/

check-format:
	python -m black --check src/main/python/fobis/

dist: clean build

upload-test: dist
	python -m twine upload --repository testpypi dist/*

upload: dist
	python -m twine upload dist/*
