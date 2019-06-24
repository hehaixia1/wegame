import Felgo 3.0
import QtQuick 2.0
import GameScoreType 1.0
import "../game"

BaseScene{
    id:scene
    width:320
    height:480

    opacity: 0


    signal titleScenePressed()
    property int score

    //申请一个组件
    GameScore{
        id:gameScore
    }

    //实体控制
    EntityManager{
        id:entityManager
        entityContainer: gameArea

    }
     //背景图片
    BackgroundImage{
        id:gamebackground
        source: "../../assets/+hd/JuicyBackground.png"
        anchors.centerIn: scene.gameWindowAnchorItem
    }
    //背景音乐
    BackgroundMusic{
    source: "../../assets/music/BG.mp3"
    autoPlay: true


}
    GameSound{
        id:gameSound
    }

    Image{
        id:grid
        source: "../../assets/game/Grid.png"
        width: 258
        height: 378
        anchors.horizontalCenter: scene.horizontalCenter
        anchors.bottom: scene.bottom
        anchors.bottomMargin: 92
    }

    GameArea{
        id:gameArea
        anchors.horizontalCenter: scene.horizontalCenter
        anchors.verticalCenter:grid.verticalCenter
        blockSize: 30

        onGameOver: gameOverWindow.show()
    }

    GameOverWindow{
        id:gameOverWindow
        y:90
        opacity: 0
        anchors.horizontalCenter: scene.horizontalCenter
        onNewGameClicked: scene.startGame()
    }
    Image {
               id:home
               width: 20
               height: 20
               source: "../../assets/list/icon-back.png"
               anchors.verticalCenter:  parent.verticalCenter
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



    function startGame(){
        gameOverWindow.hide()
        gameArea.initializeField()
        scene.score = 0
    }
    function startTitle(){
        scene.hide()
        TitleScene.show()
    }

}


