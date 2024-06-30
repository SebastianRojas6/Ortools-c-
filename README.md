# Configurar un proyecto en Ortools usando VS

Tutorial by amigo de Cueto.cpp

## Requisitos

- MinGW (U otro compilador de c++)
- Cmake (Se necesita instalar en el path)
- Visual Studio (Enterprise/Community 2022/Enterprise 2022)

## Paso 1:

Ir al repositorio y descargar el proyecto 
[Descargar](https://github.com/google/or-tools)

## Paso 2:

>**Importante**
Ejecutar todo con el símbolo de sistema de herramientas nativas x64 (no el símbolo de desarrolladores)

En este tutorial se usará el **MinGW Command Prompt** 

![MinGW](img/MinGW.png)

Entra a la carpeta de Ortools

`cd C:\Users\HP\Desktop\Ortools ` 

## Paso 3:

Entra al proyecto que deseas probar, ejemplo

`cd C:\Users\HP\Desktop\Ortools\examples\assignment_groups_mip`

## Paso 4 (Opcional):

Crea un directorio y trabaja desde ahí

~~~
mkdir build
cd build
~~~


## Paso 5:

Buildea el proyecto, ya en la url que tengas debes escribir lo siguiente

`cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="C:\Users\HP\Desktop\Ortools" -S .. -B .`

**OJO :**
> Donde esta DCMAKE_PREFIX_PATH = " "
> Coloca el directorio donde está alojado tu proyecto

## Paso 6

Compila el proyecto con lo siguiente

Solo debería detectar un archivo **.cc**

`cmake --build . --config Release`

Ejemplo: 

![cc](/img/cc.png)

## Paso 7

Si no ha aparecido ningún error hasta ahí se debería poder ejecutar el .exe generado en el paso 6. Para eso 

### Si creaste un build

~~~

cd Release
cd bin
NombreDelArchivo.exe
~~~

### Resultado:

![Resultado](/img/image.png)

---

# Usar las librerías de ortools a conveniencia

Para crear y usar las librerías del ortools a conveniencia es necesario que crees una carpeta con lo siguiente

~~~

    Carpeta
    |
    |
    |__ Archivo.cc
    |
    |__ CMakeLists.txt


~~~
## Paso 0

Si no sabes como crear un archivo cmake, solo copia y pega esto:

> Nota: Solo debes cambiar 2 cosas aquí (Dependiendo del nombre de tu archivo .cc) **Cambia todos los "hola" que veas en el siguiente código**

~~~
cmake_minimum_required(VERSION 3.18)

option(CMAKE_EXPORT_COMPILE_COMMANDS "Export compile command" OFF)

project(hola VERSION 1.0 LANGUAGES CXX)
message(STATUS "${PROJECT_NAME} version: ${PROJECT_VERSION}")

if(MSVC)
  set(CMAKE_CXX_STANDARD 20)
else()
  set(CMAKE_CXX_STANDARD 17)
endif()
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH True)

get_property(isMultiConfig GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(isMultiConfig)
  if(NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_CONFIGURATION_TYPES "Release;Debug" CACHE STRING
    "Choose the type of builds, options are: Debug Release RelWithDebInfo MinSizeRel. (default: Release;Debug)"
    FORCE)
  endif()
  message(STATUS "Configuration types: ${CMAKE_CONFIGURATION_TYPES}")
else()
  if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING
    "Choose the type of build, options are: Debug Release RelWithDebInfo MinSizeRel. (default: Release)"
    FORCE)
  endif()
  message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")
endif()

include(GNUInstallDirs)
if(UNIX)
  option(BUILD_SHARED_LIBS "Build shared libraries (.so or .dylib)." ON)
  set(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE)
  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_BINDIR})
  foreach(OutputConfig IN LISTS CMAKE_CONFIGURATION_TYPES)
    string(TOUPPER ${OutputConfig} OUTPUTCONFIG)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${CMAKE_BINARY_DIR}/${OutputConfig}/${CMAKE_INSTALL_LIBDIR})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${CMAKE_BINARY_DIR}/${OutputConfig}/${CMAKE_INSTALL_LIBDIR})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${CMAKE_BINARY_DIR}/${OutputConfig}/${CMAKE_INSTALL_BINDIR})
  endforeach()
else()
  option(BUILD_SHARED_LIBS "Build shared libraries (.dll)." OFF)
  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_BINDIR})
  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_BINDIR})
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_BINDIR})
  foreach(OutputConfig IN LISTS CMAKE_CONFIGURATION_TYPES)
    string(TOUPPER ${OutputConfig} OUTPUTCONFIG)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${CMAKE_BINARY_DIR}/${OutputConfig}/${CMAKE_INSTALL_BINDIR})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${CMAKE_BINARY_DIR}/${OutputConfig}/${CMAKE_INSTALL_BINDIR})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${CMAKE_BINARY_DIR}/${OutputConfig}/${CMAKE_INSTALL_BINDIR})
  endforeach()
endif()

find_package(ortools REQUIRED CONFIG)

add_executable(${PROJECT_NAME} hola.cc)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_compile_features(${PROJECT_NAME} PUBLIC
  $<IF:$<CXX_COMPILER_ID:MSVC>,cxx_std_20,cxx_std_17>)
target_link_libraries(${PROJECT_NAME} PRIVATE ortools::ortools)

set_property(GLOBAL PROPERTY CTEST_TARGETS_ADDED 1)
include(CTest)
if(BUILD_TESTING)
  add_test(NAME test_${PROJECT_NAME} COMMAND ${PROJECT_NAME} )
endif()

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME})
~~~


## Paso 1

Entra a la carpeta que tengas

`cd C:\Users\HP\Desktop\hola`


>**Importante**
Ejecutar todo con el símbolo de sistema de herramientas nativas x64 (no el símbolo de desarrolladores)

En este tutorial se usará el **MinGW Command Prompt** 

![MinGW](img/MinGW.png)


## Paso 2 (Opcional)

Crea un directorio y trabaja desde ahí

~~~
mkdir build
cd build
~~~

## Paso 3

Buildea el proyecto, ya en la url que tengas debes escribir lo siguiente

`cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="C:\Users\HP\Desktop\Ortools" -S .. -B .`

**OJO :**
> Donde esta DCMAKE_PREFIX_PATH = " "
> Coloca el directorio donde está alojado **Tu repositorio de Ortools** 

Ese es tu path y es donde se saca las librerías y todo lo que se necesita para buildear un proyecto

## Paso 4

Compila el proyecto con lo siguiente

Solo debería detectar un archivo **.cc**

`cmake --build . --config Release`

## Paso 5

### Si creaste un build

~~~

cd Release
cd bin
NombreDelArchivo.exe
~~~


> Nota: En teoría ya debería estar todo compilado