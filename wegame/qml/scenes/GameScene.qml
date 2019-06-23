import Felgo 3.0
import QtQuick 2.0
import "../game"




    BaseScene{
        id:scene
        width:320
        height:480

        opacity: 0


        signal titleScenePressed()
        property int score

        BackgroundImage{
            id:gamebackground
            source: "../../assets/JuicyBackground.png"
            anchors.centerIn: scene.gameWindowAnchorItem
        }
        Image {
                   id:home
                   width: 52
                   height: 45
                   source: "../../assets/HomeButton.png"
                   anchors.bottom: parent.bottom
                   anchors.left: parent.left
                   MouseArea{
                       anchors.fill: parent
                       onClicked: titleScenePressed()

                 }
                 visible: opacity > 0
                 enabled: opacity == 1

                 Behavior on opacity {
                     PropertyAnimation{ duration: 200}
                 }


               }
        Text{
            font.family: gameFont.name
            font.pixelSize: 12
            color: "red"
            text: scene.score
            anchors.horizontalCenter: parent.horizontalCenter
            y:446
        }
        GameArea{
            id:gameArea
            anchors.horizontalCenter: scene.horizontalCenter
            blockSize: 30
            y:20
            onGameOver: gameOverWindow.show()
        }

        GameOverWindow{
            id:gameOverWindow
            y:90
            opacity: 0
            anchors.horizontalCenter: scene.horizontalCenter
            onNewGameClicked: scene.startGame()
        }


        function startGame(){
            gameOverWindow.hide()
            gameArea.initializeField()
            scene.score = 0
        }
    }


