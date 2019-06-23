import Felgo 3.0
import QtQuick 2.0
import "./game"
import "./scenes"

GameWindow{
    id:gameWindow

    screenWidth:640
    screenHeight:960


    //onSplashScreenFinished: gameWindow.startGame()
    FontLoader{// 加载字体
        id:gameFont
        source:"../assets/fonts/akaDylan Plain.ttf"
    }

    EntityManager{
        id:entityManager
        entityContainer: gameScene

    }

    TitleScene{
        id:titleWindow
        onPlayClicked :{
            gameWindow.state = "game"
            gameScene.startGame()
        }
    }

    GameScene{
        id:gameScene
        onTitleScenePressed:{
            gameWindow.state = "menu"
            //gameScene.stop()
        }
    }


    state:"meun"

    states:[
        State{
            name:"meun"
            PropertyChanges{
                target: titleWindow
                opacity:1
            }
        },
        State{
            name:"game"
            PropertyChanges{
                target:gameScene
                opacity:1
            }
        }

    ]



}
