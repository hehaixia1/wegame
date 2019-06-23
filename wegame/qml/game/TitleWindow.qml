//import Felgo 3.0
//import QtQuick 2.0

//Item{
//    id: titleWindow

//        width: 640
//        height:960
//        visible: opacity > 0
//        enabled: opacity == 1
//        signal playClicked()
//        Behavior on opacity {
//            NumberAnimation {duration: 400 }
//        }
//        BackgroundImage {
//            id:ground

//            source: "../../assets/BG.png"
//            anchors.fill: parent

//        }
//        Image {
//            id: juicyLogo
//            source: "../../assets/JuicySquashLogo.png"
//            width: 300
//            height: 150
//            anchors.horizontalCenter: titleWindow.horizontalCenter
//            anchors.top: titleWindow.top
//            anchors.topMargin: 10
//        }
//        Button{
//            id:play
//            text: "开始游戏"
//            width: 160; height: 50
//            anchors.horizontalCenter: ground.horizontalCenter
//            anchors.verticalCenter: ground.verticalCenter
//            onClicked: playClicked()
//        }


//        Button{
//            id:button1
//            width: 160; height: 50
//            text: "继续游戏"
//            anchors.horizontalCenter: ground.horizontalCenter
//            anchors.top:play.bottom
//          //  anchors.bottomMargin: 330
//        }

//        Button{
//            id:button2
//            width: 160; height: 50
//            text: "排行榜"
//            anchors.horizontalCenter: ground.horizontalCenter
//            anchors.top: button1.bottom
//          //  anchors.bottomMargin: 230
//        }

//        Button{
//            width: 160; height: 50
//            text: "游戏设置"
//            anchors.horizontalCenter: ground.horizontalCenter
//            anchors.top: button2.bottom
//         //   anchors.bottomMargin: 130
//        }



//}
