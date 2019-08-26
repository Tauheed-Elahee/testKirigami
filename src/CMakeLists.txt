# Include header files for the Qt project
include_directories(${Qt5Widgets_INCLUDE_DIRS} ${QtQml_INCLUDE_DIRS})
add_definitions(${Qt5Widgets_DEFINITIONS} ${Qt5Quick_DEFINITIONS} ${QtQml_DEFINITIONS})

# Find Qt modules
find_package(Qt5QuickCompiler)
qtquick_compiler_add_resources(QT_RESOURCES ${CMAKE_CURRENT_SOURCE_DIR}/qml/resources.qrc)

# Special paramters for the compiler to compile a Qt project with a graphical user interface
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${Qt5Widgets_EXECUTABLE_COMILE_FLAGS}")


# INFO: this is no longer needed
# # Additional compilation steps for moc, rcc and uic for Qt programs
# set(CMAKE_AUTOMOC ON)
# set(CMAKE_AUTORCC ON)
# set(CMAKE_AUTOUIC ON)

# Project executable
set(PROJECT "testKirigami")
project(${PROJECT})

# Compiler flags for compiling C++ sources
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror -std=c++11 -fstrict-aliasing -pedantic-errors -pedantic -Wno-deprecated-declarations -Wno-unused-variable")


# Define HEADERS and SOURCES varibales for all header and source files
if(NOT DEFINED HEADERS)
    file(GLOB HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/*.h)
endif()
if(NOT DEFINED SOURCES)
    file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
endif()

# The source_group definition creates a group of files that are placed in some build systems
source_group("Header Files" FILES ${HEADERS})
source_group("Source Files" FILES ${SOURCES})

# Make an executable
add_executable(${PROJECT} ${HEADERS} ${SOURCES} ${QT_RESOURCES})

target_link_libraries(${PROJECT}
    Qt5::Widgets
    Qt5::Qml
    Qt5::Quick
    KF5::Kirigami2
)
