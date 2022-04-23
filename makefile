
DEBUG_OPTS:=$$( if [ ! -z $$DEBUG ]; then echo ; else echo \> /dev/null; fi )

options:
	@echo "all | clean | build | deploy | show | git-status"
	@echo
	@echo "all: alias for main"
	@echo "main: does everything. (clean,build,deploy)"
	@echo
	@echo "clean: deletes deploy directory and other build files/folders"
	@echo "build: generates blog and other assets in separate folders"
	@echo "deploy: brings built assets into a single folder, defined in blogit"
	@echo
	@echo output redirection is: $(DEBUG_OPTS)
	@echo to set **output redirection** define the DEBUG variable to a
	@echo non-empty value. e.g.:
	@echo make all DEBUG=1
	@echo will print all output.

all: main

main: clean build deploy

clean:
	rm -rf www/     			$(DEBUG_OPTS)
	./blogit clean  			$(DEBUG_OPTS)

build:
	./blogit build 				$(DEBUG_OPTS)

deploy:
	./blogit deploy 			$(DEBUG_OPTS)

show:
	xdg-open www/index.html		$(DEBUG_OPTS)

git-status:
	git status					$(DEBUG_OPTS)

