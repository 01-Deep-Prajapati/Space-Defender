import QtQuick
import QtQuick.Layouts
import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 1536
    height: 864
    visible: true
    title: qsTr("Game")

    Rectangle{
        id:gameArea
        anchors.fill: parent
        visible: true
        gradient: Gradient
        {
            GradientStop { position: 0.0; color:"#132330" }
            GradientStop { position: 1.0; color:"black" }
        }

        Rectangle{
            id:gameOverlay
            anchors.fill: parent
            visible: false
            color: "black"
            z:1001
            opacity: 0.8

            ColumnLayout{
                anchors.centerIn: parent
                spacing: 20
                Text{
                    id:gameOver
                    text: qsTr("Game Over\n") + control.score
                    font.pixelSize: 40
                    color:"white"
                    Layout.alignment: Qt.AlignHCenter
            }
            RowLayout{
                    spacing: 20
                Rectangle{
                    id:closeBtn
                    width: 300
                    height: 35
                    radius: 20
                    color:"gray"
                    Text{
                        text: qsTr("Close")
                        color:"white"
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        hoverEnabled: true
                        anchors.fill: parent
                        onEntered: {
                            closeBtn.color = "red"
                        }
                        onExited: {
                            closeBtn.color = "gray"
                        }
                        onClicked: {
                            Qt.quit()
                        }
                    }
                }
                Rectangle{
                    id:restartBtn
                    width: 300
                    height: 35
                    radius: 20
                    color:"gray"
                    Text{
                        text: qsTr("Restart")
                        color:"white"
                    anchors.centerIn: parent
                    }
                    MouseArea{
                        hoverEnabled: true
                        anchors.fill: parent
                        onEntered: {
                            restartBtn.color = "green"
                        }
                        onExited: {
                            restartBtn.color = "gray"
                        }
                        onClicked: {
                            control.restartGame();
                            gameOverlay.visible = false
                        }
                    }
                }
            }
        }


        }
        Connections{
            target: control
            onGameOver:{
                gameOverlay.visible = true
            }
        }

        Rectangle{
            id: move
            width:85
            height:85
            color:"transparent"
            x:control.x
            y:control.y
            focus:true
            Image {
                id: player
                source: "qrc:/player/imges/rocket.png"
                width:55
                height: 55
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
            }

            AnimatedImage{
                id: thruster
                source: "qrc:/player/imges/thruster.gif"
                width:30
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: player.bottom
                playing: true
            }

            Keys.onPressed: (event) =>{
                                if(event.key === Qt.Key_Left){
                                    control.moveLeft()
                                }
                                if(event.key === Qt.Key_Right){
                                    control.moveRight()
                                }
                                if(event.key === Qt.Key_Up){
                                    control.applyThrust()
                                }
                                if(event.key === Qt.Key_Space){
                                    control.fireBullet()
                                }
                                event.accepted = true

                                thruster.playing = true
                            }

            Keys.onReleased: (event) =>{
                                if(event.key === Qt.Key_Left || event.key === Qt.Key_Right){
                                    control.stopMovement()
                                }
                                thruster.playing = true
                            }

            Component.onCompleted: {
                move.forceActiveFocus();
                thruster.playing = true;

            }
        }

        Text{
            id:scoreBoard
            text:"SCORE: " + control.showScore()
            styleColor: "#c4a5a5"
            color:"white"
            x:50
            y:50
            font.pixelSize: 40

            Connections{
                target: control
                function onScoreChanged(){
                    scoreBoard.text = "SCORE: " + control.showScore()
                }
            }
        }

        Repeater{
            model:control.bullets
            delegate:Bullet{}
        }

        Repeater{
            model:control.enemies
            delegate: Enemy{}
        }
    }
}
