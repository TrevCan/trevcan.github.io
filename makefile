
DEBUG_OPTS:= > /dev/null
#DEBUG_OPTS:= 

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

all: main

main: clean build deploy

clean:
	rm -rf www/     			 $(DEBUG_OPTS)
	./blogit clean  			 $(DEBUG_OPTS)

build:
	./blogit build 				 $(DEBUG_OPTS)

deploy:
	./blogit deploy 			 $(DEBUG_OPTS)

show:
	xdg-open www/index.html		 $(DEBUG_OPTS)

git-status:
	git status					 $(DEBUG_OPTS)

