cmake_minimum_required(VERSION 3.16)

project(Game VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appGame
    main.cpp
)

qt_add_qml_module(appGame
    URI Game
    VERSION 1.0
    QML_FILES main.qml
    SOURCES Controller.h Controller.cpp
    SOURCES
    SOURCES
    QML_FILES Bullet.qml
    SOURCES Bullet.h Bullet.cpp
    SOURCES Enemy.h Enemy.cpp
    QML_FILES Enemy.qml
    RESOURCES assets/assets.qrc
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appGame PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appGame
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appGame
    PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(TARGETS appGame
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
