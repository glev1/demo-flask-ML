install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black *.py

lint:
	pylint --disable=R,C,W1203,E1101 mlib
	docker run --rm -i hadolint/hadolint < Dockerfile

test:
	python -m pytest -vv --cov=cli --cov=mlib --cov=utilscli test_mlib.py

build:
	docker build -t flask-ml:latest .

run:
	docker run -p 8080:8080 flask-ml

all: install lint test
