import Felgo 3.0
import QtQuick 2.0

GameWindow{
    id:gameWindow

//    activeScene:scene
    screenWidth:640
    screenHeight:960

    onSplashScreenFinished: scene.startGame()


    EntityManager{
        id:entityManager
        entityContainer: gameArea

    }


    FontLoader{// 加载字体
        id:gameFont
        source:"../assets/fonts/akaDylan Plain.ttf"
    }


   Scene{
    id:scenbegin
    TitleWindow{
    id:titleWindow
    anchors.fill: parent
    onPlayClicked :{
//        scene.enabled=true
        scene.opacity=1
        scenbegin.opacity=0
    }
    }
}

    Scene{
        id:scene
        width:320
        height:480

        opacity: 0



        property int score

        BackgroundImage{
            source: "../assets/JuicyBackground.png"
            anchors.centerIn: scene.gameWindowAnchorItem
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

}
