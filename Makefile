# This target is for installation. It first updates pip (Python's package manager), and then installs the requirements specified in the requirements.txt file.
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

# This target runs the linting tool pylint on the file app.py. Some warning categories (R, C, W1203, W0702) are disabled.
lint:
	pylint --disable=R,C,W1203,W0702 app.py

# This target runs unit tests using pytest module on the test_app.py file. It also uses coverage to measure the code covered by tests.
test:
	python -m pytest -vv --cov=app test_app.py

# This target formats all .py files in the current directory to meet PEP 8 style guide using the Black code formatter.
format:
	black *.py

# This is a special target that represents multiple targets. When 'make all' is run, it will run the install, lint, test, and format targets.
all: install lint test format


# In the command pylint --disable=R,C,W1203,W0702 app.py, the --disable flag is used to disable certain types of warnings. 
# In this case, the warnings categories R, C, W1203, and W0702 are being disabled.

# R and C are two broad categories of warnings. R stands for Refactor warnings and C stands for Convention warnings.

#     Refactor warnings (R): This category includes warnings about the code that can be refactored to improve readability, 
# 		maintainability, and sometimes performance.

#     Convention warnings (C): These warnings are about programming standard conventions. Pylint uses PEP 8, the Python style guide, by default.

# 	  W1203 and W0702 are specific warning codes:

#     	W1203 (logging-fstring-interpolation): This warning is triggered when f-strings are used in logging function calls. 
# 			It's recommended to use lazy % formatting in logging functions because it improves performance for unneeded log messages.

#     	W0702 (bare-except): This warning is raised when an except clause doesn't specify the type of the exception, which means it will 
# 			catch all types of exceptions. It's recommended to avoid this as it can hide errors that you might have not anticipated and can make debugging harder.

# These are just guidelines and can be suppressed if the programmer has reasons to deviate from these conventions or if these warnings are causing too much noise.