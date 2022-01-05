install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black *.py

lint:
	pylint --disable=R,C,W1203,E1101 mlib
	docker run --rm -i hadolint/hadolint < Dockerfile

all: install lint test
