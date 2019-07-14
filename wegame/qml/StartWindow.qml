import QtQuick 2.0
import Felgo 3.0

Item {
    id: startWindow
    width: 232
    height: 160

    visible: opacity > 0


    enabled: opacity == 1

    signal simpleClicked
    signal aboutClicked
    signal setClicked
    signal continueClicked()

    FontLoader {
        id: startFont
        source: "../assets/fonts/text.ttf"
    }
    Image {
        id: startimage
        source: "../assets/BG.jpg"
        anchors.fill: parent

        Text {
            // 设置字体
            font.family: startFont.name
            font.pixelSize: 20
            color: "#1a1a1a"
            text: "开始游戏"

            // 位置
            anchors.horizontalCenter: parent.horizontalCenter
            y: 180

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    startWindow.simpleClicked()
                }
            }

            SequentialAnimation on color {
                loops: Animation.Infinite
                PropertyAnimation {
                    to: "white"
                    duration: 1000
                }
                PropertyAnimation {
                    to: "blue"
                    duration: 4000
                }
            }
        }

        Text {
            // 设置字体
            font.family: startFont.name
            font.pixelSize: 20
            color: "#1a1a1a"
            text: "继续游戏"

            // 位置
            anchors.horizontalCenter: parent.horizontalCenter
            y: 230

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    startWindow.continueClicked()
                }
            }

            SequentialAnimation on color {
                loops: Animation.Infinite
                PropertyAnimation {
                    to: "white"
                    duration: 2000
                }
                PropertyAnimation {
                    to: "blue"
                    duration: 3000
                }
            }
        }

        Text {
            // 设置字体
            font.family: startFont.name
            font.pixelSize: 20
            color: "#1a1a1a"
            text: "游戏设置"

            // 位置
            anchors.horizontalCenter: parent.horizontalCenter
            y: 280

            MouseArea {
                anchors.fill: parent
                onClicked: {
                   startWindow.setClicked()
                }
            }

            SequentialAnimation on color {
                loops: Animation.Infinite
                PropertyAnimation {
                    to: "white"
                    duration: 3000
                }
                PropertyAnimation {
                    to: "blue"
                    duration: 2000
                }
            }
        }
        Text {
            // 设置字体
            font.family: startFont.name
            font.pixelSize: 20
            color: "#1a1a1a"
            text: "关于"

            // 位置
            anchors.horizontalCenter: parent.horizontalCenter
            y: 330
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    startWindow.aboutClicked()
                }
            }

            // 字体闪动
            SequentialAnimation on color {
                loops: Animation.Infinite
                PropertyAnimation {
                    to: "white"
                    duration: 4000
                }
                PropertyAnimation {
                    to: "blue"
                    duration: 1000
                }
            }
        }
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 400
        }
    }

    function startWindowHide() {
        startWindow.opacity = 0
        startWindow.enabled = 0
    }
}
