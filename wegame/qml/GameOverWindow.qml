import Felgo 3.0
import QtQuick 2.0

Item {
    id: gameOverWindow

    width: 260
    height: 200

        visible: opacity > 0
        enabled: opacity == 1

    signal newGameClicked
    signal returnStartMenue
    Image {
        source: "../assets/GameOver.png"
        anchors.fill: parent
    }

    // 显示分数
    Text {
        font.family: gameFont.name
        font.pixelSize: 30
        color: "#1a1a1a"
        text: scene.score

        anchors.horizontalCenter: parent.horizontalCenter
        y: 100
    }

    // 在玩一次按钮
    Text {

        font.family: gameFont.name
        font.pixelSize: 30
        color: "red"
        text: "再玩一次"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40

        MouseArea {
            anchors.fill: parent
            onClicked: gameOverWindow.newGameClicked()
        }

        SequentialAnimation on color {
            loops: Animation.Infinite
            PropertyAnimation {
                to: "#ff8800"
                duration: 1000
            }
            PropertyAnimation {
                to: "blue"
                duration: 1000
            }
        }
    }

    Text {

        font.family: gameFont.name
        font.pixelSize: 15
        color: "orange"
        text: "返回"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15

        MouseArea {
            anchors.fill: parent
            onClicked: {
                returnStartMenue()
            }
        }
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 400
        }
    }

    // 显示游戏结束的窗口
    function show() {
        gameOverWindow.opacity = 1
    }

    // 隐藏窗口
    function hide() {
        gameOverWindow.opacity = 0
    }

}
