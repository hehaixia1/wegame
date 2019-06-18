import Felgo 3.0
import QtQuick 2.0

GameWindow {
  id: gameWindow

  screenWidth: 1024
  screenHeight: 768
  Scene {
    id: scene
    width: 480
    height: 320

    property int score: 0
   // property int time:0

    Rectangle {
      anchors.fill: scene.gameWindowAnchorItem
      color: "#324566"
    }
    Text {
         text: "Score" + scene.score //属性绑定，是一个JS的表达式，每当score表达式改变的时候，text属性都会被更新
         color: "white"
         anchors.horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter// 确定一个文本的位置，需要使用两个描述位置的锚
         anchors.top: scene.gameWindowAnchorItem.top
       }
    Timer{
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            scene.increaseScore(1)

            }
    }

    Image {
        id:image
        source: "../assets/felgo-logo.png"
        width:100
        height:100
        x:0;y:0
    }
    SequentialAnimation{
        id:imageAnimation
        NumberAnimation{
            target: image
            property:"x"
            from:0
            to:500
            duration: 150
        }
        NumberAnimation{
            target: image
            property:"x"
            from:500
            to:0
            duration: 150
        }
    }

//    NumberAnimation{
//        id:imageAnimation
//        target: image
//        property:"x"
//        from:0
//        to:15
//        duration: 150
//    }

    Column{
        anchors.centerIn: scene
        spacing: 10


        MyButton{
            labelText: "Add 1"
            onClicked:{
                scene.increaseScore(1)
            }
        }
        MyButton{
            labelText: "Add 10"
            onClicked:{
                scene.increaseScore(10)
            }
        }
        MyButton{
            labelText: "Add 100"
            onClicked: {
                scene.increaseScore(100)
            }
        }


       }
    function increaseScore(amount){
        scene.score += amount
        imageAnimation.start()
    }

   }
}
