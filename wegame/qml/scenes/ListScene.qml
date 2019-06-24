import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.0
import "../scenes"
import "../game"


BaseScene{
    id:listscene

    signal listScene()

    Image{
        id:listbg
        source: "../../assets/list/BGlist.jpg"
        anchors.centerIn: parent
        scale: 0.5
    }

    Image{
        id:listtohome
        width: 20
        height: 20
        source: "../../assets/list/icon-back.png"

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left

        MouseArea{
            anchors.fill:parent
            onClicked:listScene()
        }
    }

    Text{
        text: qsTr("上一次游戏分数")
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50
}
    //显示最后一次游戏得分
    Text{
        id:scoreText
        text: gameScore.score
        color: "red"
        font.bold:true
        font.pointSize:24
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter


    }
}



