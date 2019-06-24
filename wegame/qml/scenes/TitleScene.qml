import Felgo 3.0
import QtQuick 2.0
import "../game"


BaseScene{

    id: titlescene

    signal playClicked()
    signal settingClicked()
    signal listClicekd()
    signal gameContinueClicked()
    Behavior on opacity {
        NumberAnimation {duration: 400 }
    }

    BackgroundImage {
        id:ground

        source: "../../assets/title/BG.jpg"
        anchors.fill: parent

    }


    Button{
        id:play
        text: "开始游戏"
        width: 160; height: 50
        anchors.horizontalCenter: ground.horizontalCenter
        anchors.verticalCenter: ground.verticalCenter
        onClicked: playClicked()
    }

    Button{
        id:button1
        width: 160; height: 50
        text: "继续游戏"
        anchors.horizontalCenter: ground.horizontalCenter
        anchors.top:play.bottom
        onClicked: gameContinueClicked()
    }

    Button{
        id:button2
        width: 160; height: 50
        text: "成就榜"
        anchors.horizontalCenter: ground.horizontalCenter
        anchors.top: button1.bottom
        onClicked: {
            gameScore.load()
            console.log(gameScore.score)
            listClicekd()
        }
    }

    Button{
        id:button4
        width: 160; height: 50
        text: "游戏设置"
        anchors.horizontalCenter: ground.horizontalCenter
        anchors.top: button2.bottom
        onClicked:settingClicked()

    }



}
