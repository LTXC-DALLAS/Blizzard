
all:
	upc -d D96 -c MyProg_ext.una
	MethodCompiler -f MyProg_ext.una

clean_patterns:
	- /bin/rm -rf ../Patterns/Binary/*

clean_code:
	- /bin/rm -rf ../Libraries/Blizzard_Library/i686*
	- /bin/rm -rf ../Libraries/Blizzard_Library/tmpfiles
	- /bin/rm -f ../Libraries/Blizzard_Library/Makefile
	- /bin/rm -rf ../Libraries/F021_Library/i686*
	- /bin/rm -rf ../Libraries/F021_Library/tmpfiles
	- /bin/rm -f ../Libraries/F021_Library/Makefile
	- /bin/rm -rf ../Libraries/TestWare_Library/i686*
	- /bin/rm -rf ../Libraries/TestWare_Library/tmpfiles
	- /bin/rm -f ../Libraries/TestWare_Library/Makefile

clean_all:
	- /bin/rm -rf ../Libraries/Blizzard_Library/i686*
	- /bin/rm -rf ../Libraries/Blizzard_Library/tmpfiles
	- /bin/rm -f ../Libraries/Blizzard_Library/Makefile
	- /bin/rm -rf ../Libraries/F021_Library/i686*
	- /bin/rm -rf ../Libraries/F021_Library/tmpfiles
	- /bin/rm -f ../Libraries/F021_Library/Makefile
	- /bin/rm -rf ../Libraries/TestWare_Library/i686*
	- /bin/rm -rf ../Libraries/TestWare_Library/tmpfiles
	- /bin/rm -f ../Libraries/TestWare_Library/Makefile
	- /bin/rm -rf ../Patterns/Binary/*


