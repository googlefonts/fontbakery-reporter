all: install

clean:
	- rm dist/*.whl dist/*.tar.gz dist/*.zip

dist-build: clean
	python3 setup.py sdist bdist_wheel

dist-push:
	twine upload dist/*.whl dist/*.zip

install:
	pip3 install --ignore-installed -r requirements.txt .

install-dev:
	pip3 install --ignore-installed -r requirements.txt -e ".[dev]"

install-user:
	pip3 install --ignore-installed --user .

jupyter:
	 python ~/venv/fontelemetry/lib/python3.7/site-packages/jupyter.py notebook

test:
	./testrunner.sh

uninstall:
	pip3 uninstall --yes fontelemetry

.PHONY: all clean dist-build dist-push install install-dev install-user jupyter test uninstall