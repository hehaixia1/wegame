import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.0
import "../game"

// EMPTY SCENE

BaseScene{
    id:settingScene

    signal titleScene()
    Image{
        id:background
        source:"../../assets/title/BG1.jpg"
        anchors.centerIn: parent
        scale: 0.5
    }
    Image{
        id:settohome
        width: 20
        height: 20
        source: "../../assets/list/icon-back.png"

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left

        MouseArea{
            anchors.fill:parent
            onClicked:titleScene()
        }
    }

    Column{
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width - 40
        spacing: 20

        Text{
            font.family: gameFont.name
            font.pixelSize: 36
            text: "设置"
            color: "black"
        }

        Text{
            font.family: gameFont.name
            font.pixelSize: 24
            text:"难易度设置"
            color:"black"
        }

        Text{
            font.family: gameFont.name
            font.pixelSize: 24
            text:"背景音乐"
            color:"black"
        }
        Text{
            font.family: gameFont.name
            font.pixelSize: 24
            text:"声音特效"
            color:"black"

        }
    }
    Column {
      anchors.right: parent.right
      anchors.rightMargin: 20
      anchors.top: parent.top
      anchors.topMargin: 77
      spacing: 8

      ToggleButton{
            label.source: active ? "../../assets/list/Switch_Hard.png" : "../../assets/list/Switch_Easy.png"
            //active: !GameInfo.easyMode
            opacity: 1
            onClicked: {
                easyMode ^= true
            }
            width:90
            height: 40
      }
      ToggleButton {
          width: 90
          height: 40
          label.source: active ? "../../assets/list/Switch_Off.png" : "../../assets/list/Switch_On.png"
          active: !settings.musicEnabled
          opacity: 1
          onClicked :{
              settings.musicEnabled ^= true
          }
      }
      ToggleButton {
        width: 90
        height: 40
        label.source: active ? "../../assets/list/Switch_Off.png" : "../../assets/list/Switch_On.png"
        active: ! settings.soundEnabled
        opacity: 1
        onClicked: {
          settings.soundEnabled ^= true
        }
      }

}

}
