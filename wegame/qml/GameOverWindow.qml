import Felgo 3.0
import QtQuick 2.0

Item {

    id:gameOverWindow

    width:232
    height: 160

    visible: opacity > 0
    enabled: opacity == 1

    signal newGameClicked()
    Image{
        source: "../assets/GameOver.png"
        anchors.fill: parent
    }
    Text{
        font.family: gameFont.name
        font.pixelSize: 30
        color: "#1a1a1a"
        text:scene.score

        anchors.horizontalCenter: parent.horizontalCenter
        y:72
    }
    Text{
        font.family: gameFont.name
        font.pixelSize: 15
        color:"red"
        text:"play again"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15

        MouseArea{
            anchors.fill:parent
            onClicked:gameOverWindow.newGameClicked()
        }

        SequentialAnimation on color {
            loops:Animation.Infinite
            PropertyAnimation{
                to:"#ff8800"
                duration: 1000
            }
            PropertyAnimation{
                to:"red"
                duration: 1000
            }
        }
    }

    function show(){
        gameOverWindow.opacity = 1

    }

    function hide(){
        gameOverWindow.opacity = 0
    }



}
