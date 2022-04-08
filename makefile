options:
	@echo "all | clean | build | deploy | show | git-status"
	@echo
	@echo "all: alias for main"
	@echo "main: does everything. (clean,build,deploy)"
	@echo
	@echo "clean: deletes deploy directory and other build files/folders"
	@echo "build: generates blog and other assets in separate folders"
	@echo "deploy: brings built assets into a single folder, defined in blogit"

all: main

main: clean build deploy

clean:
	rm -rf www/ > /dev/null 
	./blogit clean > /dev/null

build:
	./blogit build > /dev/null

deploy:
	./blogit deploy > /dev/null

show:
	xdg-open www/index.html

git-status:
	git status

