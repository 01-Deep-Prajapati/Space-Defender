# Space Defender

A fast-paced Qt-based shooting game where you defend against waves of enemies. This project is implemented in C++ and QML, demonstrating object-oriented design and interactive gameplay using the Qt framework.

## Description

A 2D game built with Qt 6 and QML where players can shoot bullets to defeat enemies. The game showcases modern C++ and QML integration, providing an interactive and engaging gaming experience.

## Features

- Written in C++ with Qt 6
- QML for UI and game logic
- Classes for game entities: Bullet, Enemy, Controller
- Asset management via Qt resource system
- Modular code structure for easy extension

## Project Structure

```
├── Bullet.cpp/.h/.qml        # Bullet entity implementation
├── Enemy.cpp/.h/.qml         # Enemy entity implementation
├── Controller.cpp/.h         # Game controller logic
├── class1.cpp/.h, class2.cpp/.h # Additional game classes
├── main.cpp                  # Application entry point
├── main.qml                  # Main QML UI
├── assets/                   # Game assets (images, qrc)
├── CMakeLists.txt            # Build configuration
├── build/                    # Build output (generated)
```

### Opening and Running in Qt Creator

1. Install Qt 6 and Qt Creator.
2. Open Qt Creator.
3. Go to **File > Open File or Project...** and select the `CMakeLists.txt` file in the project directory.
4. Configure the project with your preferred Qt kit (e.g., Desktop Qt 6.9.0 MinGW 64-bit).
5. Click the green **Run** button to build and launch the game.

### Build Instructions

1. Install Qt 6 and CMake.
2. Open a terminal in the project directory.
3. Run the following commands:
   ```powershell
   mkdir build
   cd build
   cmake .. -G "Ninja" -DCMAKE_PREFIX_PATH="<Qt installation path>"
   cmake --build .
   ```
4. Run the executable from the build output directory.

### Running the Game

- The main entry point is `main.cpp` and `main.qml`.
- Assets are loaded from the `assets/` directory using Qt's resource system.

## Customization

- Add new game entities by creating new C++/QML classes.
- Update assets in the `assets/imges/` folder and reference them in QML.
- Modify UI and game logic in `main.qml` and related QML files.

## License

This project is licensed under the terms of the LICENSE file included in the repository.

## Credits

- Qt Framework: https://www.qt.io/
- Project Author: Deep Prajapati

---

For questions or contributions, please feel free to open an issue or submit a pull request.
