# CMake generated Testfile for 
# Source directory: C:/Users/HP/Desktop/Ejemplo
# Build directory: C:/Users/HP/Desktop/Ejemplo/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(test_Ejemplo1 "C:/Users/HP/Desktop/Ejemplo/build/Debug/bin/Ejemplo1.exe")
  set_tests_properties(test_Ejemplo1 PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/HP/Desktop/Ejemplo/CMakeLists.txt;71;add_test;C:/Users/HP/Desktop/Ejemplo/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(test_Ejemplo1 "C:/Users/HP/Desktop/Ejemplo/build/Release/bin/Ejemplo1.exe")
  set_tests_properties(test_Ejemplo1 PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/HP/Desktop/Ejemplo/CMakeLists.txt;71;add_test;C:/Users/HP/Desktop/Ejemplo/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(test_Ejemplo1 "C:/Users/HP/Desktop/Ejemplo/build/MinSizeRel/bin/Ejemplo1.exe")
  set_tests_properties(test_Ejemplo1 PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/HP/Desktop/Ejemplo/CMakeLists.txt;71;add_test;C:/Users/HP/Desktop/Ejemplo/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(test_Ejemplo1 "C:/Users/HP/Desktop/Ejemplo/build/RelWithDebInfo/bin/Ejemplo1.exe")
  set_tests_properties(test_Ejemplo1 PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/HP/Desktop/Ejemplo/CMakeLists.txt;71;add_test;C:/Users/HP/Desktop/Ejemplo/CMakeLists.txt;0;")
else()
  add_test(test_Ejemplo1 NOT_AVAILABLE)
endif()
