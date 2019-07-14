import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.0


Scene{
    id:settingScene
    opacity: 0
    enabled: false
    signal home1()
    Image{
        id:background
        source:"../assets/BG1.jpg"
        anchors.centerIn: parent
        scale: 0.5
    }
    Text {
        id: returnstart1
        text: "返回"
        font.family: aboutFont.name
        font.pixelSize: 10
        color: "white"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                home1()
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

    Column{
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width - 40
        spacing: 20

        Text{
            font.family: gameFont.name
            font.pixelSize: 8
            text: "设置"
            color: "black"
        }

        Text{
            font.family: gameFont.name
            font.pixelSize: 8
            text:"难易度设置"
            color:"black"
        }

        Text{
            font.family: gameFont.name
            font.pixelSize: 8
            text:"背景音乐"
            color:"black"
        }
        Text{
            font.family: gameFont.name
            font.pixelSize: 8
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
            label.source: active ? "../assets/set/Switch_Hard.png" : "../assets/set/Switch_Easy.png"
            opacity: 1
            onClicked: {
                easyMode ^= true
            }
            width:90
            height:40
      }
      ToggleButton {
          width: 90
          height: 40
          label.source: active ? "../assets/set/Switch_Off.png" : "../assets/set/Switch_On.png"
          active: !settings.musicEnabled
          opacity: 1
          onClicked :{
              settings.musicEnabled ^= true
          }
      }
      ToggleButton {
        width: 90
        height: 40
        label.source: active ? "../assets/set/Switch_Off.png" : "../assets/set/Switch_On.png"
        active: ! settings.soundEnabled
        opacity: 1
        onClicked: {
          settings.soundEnabled ^= true
        }
      }

}
    function show() {
        settingScene.opacity = 1
        settingScene.enabled = 1
    }
    function hide() {
        settingScene.opacity = 0
        settingScene.enabled = false
    }

}
