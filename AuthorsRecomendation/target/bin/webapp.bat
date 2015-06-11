@REM ----------------------------------------------------------------------------
@REM Copyright 2001-2004 The Apache Software Foundation.
@REM
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM      http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing, software
@REM distributed under the License is distributed on an "AS IS" BASIS,
@REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM See the License for the specific language governing permissions and
@REM limitations under the License.
@REM ----------------------------------------------------------------------------
@REM

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\org\springframework\spring-context\3.0.6.RELEASE\spring-context-3.0.6.RELEASE.jar;"%REPO%"\org\springframework\spring-beans\3.0.6.RELEASE\spring-beans-3.0.6.RELEASE.jar;"%REPO%"\org\springframework\spring-core\3.0.6.RELEASE\spring-core-3.0.6.RELEASE.jar;"%REPO%"\commons-logging\commons-logging\1.1.1\commons-logging-1.1.1.jar;"%REPO%"\org\springframework\spring-expression\3.0.6.RELEASE\spring-expression-3.0.6.RELEASE.jar;"%REPO%"\org\springframework\spring-asm\3.0.6.RELEASE\spring-asm-3.0.6.RELEASE.jar;"%REPO%"\org\springframework\spring-aop\3.0.6.RELEASE\spring-aop-3.0.6.RELEASE.jar;"%REPO%"\aopalliance\aopalliance\1.0\aopalliance-1.0.jar;"%REPO%"\org\springframework\spring-webmvc\3.0.6.RELEASE\spring-webmvc-3.0.6.RELEASE.jar;"%REPO%"\org\springframework\spring-context-support\3.0.6.RELEASE\spring-context-support-3.0.6.RELEASE.jar;"%REPO%"\org\springframework\spring-web\3.0.6.RELEASE\spring-web-3.0.6.RELEASE.jar;"%REPO%"\org\springframework\spring-tx\3.0.6.RELEASE\spring-tx-3.0.6.RELEASE.jar;"%REPO%"\org\springframework\spring-orm\3.0.6.RELEASE\spring-orm-3.0.6.RELEASE.jar;"%REPO%"\org\springframework\spring-jdbc\3.0.6.RELEASE\spring-jdbc-3.0.6.RELEASE.jar;"%REPO%"\org\aspectj\aspectjtools\1.7.4\aspectjtools-1.7.4.jar;"%REPO%"\org\aspectj\aspectjrt\1.7.4\aspectjrt-1.7.4.jar;"%REPO%"\cglib\cglib\2.2.2\cglib-2.2.2.jar;"%REPO%"\asm\asm\3.3.1\asm-3.3.1.jar;"%REPO%"\commons-lang\commons-lang\20030203.000129\commons-lang-20030203.000129.jar;"%REPO%"\org\slf4j\slf4j-api\1.7.5\slf4j-api-1.7.5.jar;"%REPO%"\log4j\log4j\1.2.16\log4j-1.2.16.jar;"%REPO%"\org\slf4j\jcl-over-slf4j\1.7.5\jcl-over-slf4j-1.7.5.jar;"%REPO%"\ch\qos\logback\logback-classic\1.0.13\logback-classic-1.0.13.jar;"%REPO%"\ch\qos\logback\logback-core\1.0.13\logback-core-1.0.13.jar;"%REPO%"\ch\qos\logback\logback-access\1.0.13\logback-access-1.0.13.jar;"%REPO%"\org\apache\jena\jena-arq\2.11.0\jena-arq-2.11.0.jar;"%REPO%"\org\apache\jena\jena-core\2.11.0\jena-core-2.11.0.jar;"%REPO%"\org\apache\jena\jena-iri\1.0.0\jena-iri-1.0.0.jar;"%REPO%"\xerces\xercesImpl\2.11.0\xercesImpl-2.11.0.jar;"%REPO%"\xml-apis\xml-apis\1.4.01\xml-apis-1.4.01.jar;"%REPO%"\org\apache\httpcomponents\httpclient\4.2.3\httpclient-4.2.3.jar;"%REPO%"\org\apache\httpcomponents\httpcore\4.2.2\httpcore-4.2.2.jar;"%REPO%"\commons-codec\commons-codec\1.6\commons-codec-1.6.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-core\7.0.61\tomcat-embed-core-7.0.61.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-logging-juli\7.0.61\tomcat-embed-logging-juli-7.0.61.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-jasper\7.0.61\tomcat-embed-jasper-7.0.61.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-el\7.0.61\tomcat-embed-el-7.0.61.jar;"%REPO%"\org\eclipse\jdt\core\compiler\ecj\4.4.2\ecj-4.4.2.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper\7.0.61\tomcat-jasper-7.0.61.jar;"%REPO%"\org\apache\tomcat\tomcat-servlet-api\7.0.61\tomcat-servlet-api-7.0.61.jar;"%REPO%"\org\apache\tomcat\tomcat-juli\7.0.61\tomcat-juli-7.0.61.jar;"%REPO%"\org\apache\tomcat\tomcat-el-api\7.0.61\tomcat-el-api-7.0.61.jar;"%REPO%"\org\apache\tomcat\tomcat-api\7.0.61\tomcat-api-7.0.61.jar;"%REPO%"\org\apache\tomcat\tomcat-util\7.0.61\tomcat-util-7.0.61.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper-el\7.0.61\tomcat-jasper-el-7.0.61.jar;"%REPO%"\org\apache\tomcat\tomcat-jsp-api\7.0.61\tomcat-jsp-api-7.0.61.jar;"%REPO%"\com\objectdb\objectdb\2.6.2_02\objectdb-2.6.2_02.jar;"%REPO%"\org\eclipse\persistence\javax.persistence\2.1.0\javax.persistence-2.1.0.jar;"%REPO%"\javax\transaction\jta\1.1\jta-1.1.jar;"%REPO%"\org\springframework\samples\spring\spring-utility\1.0.0.CI-SNAPSHOT\spring-utility-1.0.0.CI-SNAPSHOT.jar
set EXTRA_JVM_ARGUMENTS=
goto endInit

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS% %EXTRA_JVM_ARGUMENTS% -classpath %CLASSPATH_PREFIX%;%CLASSPATH% -Dapp.name="webapp" -Dapp.repo="%REPO%" -Dbasedir="%BASEDIR%" launch.Main %CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=1

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@endlocal

:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
