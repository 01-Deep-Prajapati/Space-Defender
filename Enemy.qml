import QtQuick


Item{

    property var ePng: [
        "qrc:/enemy/imges/enemy1.png",
        "qrc:/enemy/imges/enemy2.png",
        "qrc:/enemy/imges/enemy3.png",
        "qrc:/enemy/imges/enemy4.png",
        "qrc:/enemy/imges/enemy5.png"
    ]

    id:enemy
    width:50
    height:50
    x:model.x
    y:model.y

    Image {
        id: enimes
        source: ePng[model.mIndex]
        anchors.fill: parent
    }
}
