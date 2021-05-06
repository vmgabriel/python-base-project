ENV=development


run:
	python run.py


clean:
	rm -Rf .pytest_cache
	rm -Rf __pycache__
	rm -Rf */*/__pycache__


unit-test:
	python -m unittest discover -v -s tests/unit


integration-test:
	python -m unittest discover -v -s tests/integration


test:
ifeq ($(ENV), development)
	make unit-test
endif
ifeq ($(ENV), local)
	make unit-test
endif
ifeq ($(ENV), test)
	make unit-test
	make integration-test
endif
ifeq ($(ENV), undefined)
	make unit-test
endif
