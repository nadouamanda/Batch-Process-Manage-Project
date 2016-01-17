@echo on

:CHECK
	ping -n 5 127.0.0.1>nul
	
	set cTime="%time:~0,5%"
	set currentTime=%cTime::=0%
	
	if %currentTime% LEQ "15000" (if %currentTime% GEQ "17000" (GOTO reCHECK)) else (GOTO START)
	
:START
	tasklist|find /i "firefox.exe"               
    if %errorlevel%==0 (GOTO kill)
	tasklist|find /i "WINWORD.EXE"
	if %errorlevel%==0 (GOTO kill) else (GOTO reCHECK)

:kill
	taskkill /f /im firefox.exe
	taskkill /f /im WINWORD.EXE
	GOTO reCHECK

:reCHECK
	GOTO CHECK