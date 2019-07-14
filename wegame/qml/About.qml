import QtQuick 2.0

Item {
    id: about
    opacity: 0
    enabled: false
    signal home
    FontLoader {
        id: aboutFont
        source: "../assets/fonts/HoneyLight.ttf"
    }

    FontLoader {
        id: aboutFont1
        source: "../assets/fonts/ani.ttf"
    }

    Rectangle {
        id: aboutimage
        color: "#2F4F4F"
        anchors.fill: parent
    }

    Text {
        id: aboutText
        font.family: aboutFont1.name
        text: "游戏规则:
玩家可以将2个相同图案的对子连接起来，
连接线不多于3根直线，就可以成功将对子消除。
在有限的时间内，玩家尽可能的获得更多的分数。
加油吧！

"
        font.pixelSize: 15
        color: "#CAFF70"
        anchors.fill: parent
        x: 20
        y: 300
    }
    Text {
        id: returnstart

        text: "返回"
        font.family: aboutFont.name
        font.pixelSize: 15
        x: 10
        y: 400
        color: "white"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                home()
            }
        }

        SequentialAnimation on color {
            loops: Animation.Infinite
            PropertyAnimation {
                to: "white"
                duration: 1000
            }
            PropertyAnimation {
                to: "#218868"
                duration: 1000
            }
        }
    }
    function show() {
        about.opacity = 1
        about.enabled = 1
    }
    function hide() {
        about.opacity = 0
        about.enabled = false
    }
}
