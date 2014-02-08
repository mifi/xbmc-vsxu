CC=g++
CFLAGS=-fPIC -Wall -c `pkg-config --cflags libvsxu`
LDFLAGS=-shared `pkg-config --libs libvsxu`
OUTLIB=vsxu.vis
PREFIX=/usr

all: ${OUTLIB}

$(OUTLIB): addon.o
	$(CC) $(LDFLAGS) -o $@ $^

addon.o: addon.cpp
	$(CC) $(CFLAGS) addon.cpp

clean:
	rm -rf *.o $(OUTLIB)

install: all
	mkdir -p $(PREFIX)/share/xbmc/addons/visualization.vsxu
	install -m 644 $(OUTLIB) $(PREFIX)/share/xbmc/addons/visualization.vsxu
	install -m 644 icon.png $(PREFIX)/share/xbmc/addons/visualization.vsxu
	install -m 644 addon.xml $(PREFIX)/share/xbmc/addons/visualization.vsxu
