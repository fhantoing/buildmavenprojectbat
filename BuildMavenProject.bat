:: @autor: Héctor Fabio Lame López
:: @date: Mayo 2023
:: Archivo de Secuencia de comandos del Sistema .bat
:: Sistema Operativo Windows.

@echo off
setlocal

set projectName=%1
set workspace=C:\eclipse-workspace
set contextproject=com.computerx.microservices
set pathproject=com\computerx\microservices

cd %workspace%

if [%projectName%] == [] (
set projectName=mstest
echo Se sugiere cambiar nombre del proyecto.
)

echo Creando proyecto %projectName%...
call mvn archetype:generate -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false -Dversion=1.0.0 -DgroupId=%contextproject%.%projectName% -DartifactId=%projectName%

echo Creando estructura Hexagonal para %projectName%...
cd %projectName%\src\main\java\%pathproject%\%projectName%

mkdir application
mkdir domain
mkdir infraestructure
echo Primer nivel - OK


cd domain
mkdir exception model
cd ..
cd infraestructure
mkdir adapters ports
cd ..
echo Segundo Nivel - OK

cd infraestructure\ports
mkdir input output
cd ..
cd adapters
mkdir configuration input output
echo Tercer nivel - OK

cd input
mkdir service
cd service
mkdir data dto mapper
cd ..\..
cd output
mkdir persistence exception
cd persistence
mkdir entity mapper repository
echo Cuarto y quinto nivel - OK
cd ..\..\..\..\..\..\..\..\..\..\..\..

echo Maven Project created!!
endlocal