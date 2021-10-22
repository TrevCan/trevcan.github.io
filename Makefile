index:
	./make.sh

all: index clean show
	echo "Done with: "
	echo "make index, clean, print"

clean:
	echo "Deleting www.*"
	rm www.*

show:
	cat index.md


# files to clean up
# all start with literal "www."
# www www.md www.raw.titles www.raw.urls www.titles www.urls
