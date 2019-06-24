import Felgo 3.0
import QtQuick 2.0
import GameScoreType 1.0
import "./game"
import "./scenes"

GameWindow{
    id:gameWindow

    screenWidth:640
    screenHeight:960


    //onSplashScreenFinished: gameWindow.startGame()
    FontLoader{// 加载字体
        id:gameFont
        source:"../assets/fonts/text.ttf"
    }

    EntityManager{
        id:entityManager
        entityContainer: gameScene

    }
    //分数存取
    GameScore{
        id:gameScore
    }
    //继续游戏组件
    GameContinue{
        id:gameContinue
    }

       //主界面
    TitleScene{
        id:titleWindow
        //开始游戏信号处理器
        onPlayClicked :{
            gameWindow.state = "game"
            gameScene.startGame()
        }
        //游戏设置信号处理器
        onSettingClicked: {
            gameWindow.state = "setting"
        }
        //排行榜信号处理器
        onListClicekd: {
            gameWindow.state = "list"
        }
        //继续游戏信号处理器
        onGameContinueClicked : {
                gameWindow.state = "game"
                gameScene.readstart()

            }

    }

    //游戏界面
    GameScene{
        id:gameScene
        onTitleScenePressed:{
            gameWindow.state = "title"
        }
    }

    //排行榜
    ListScene{
        id:listscene
        onListScene: {
            gameWindow.state = "title"
        }
    }

    //设置界面
    SettingScene{
        id:settingScene
        onTitleScene : {
            gameWindow.state = "backhome"
            gameScene.startGame()
        }
    }


    state:"title"

    states:[
        State{
            name:"title"
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
        },
        State{
            name:"backhome"
            PropertyChanges{
                target:titleWindow
                opacity:1
            }
        },
        State{
            name:"setting"
            PropertyChanges{
                target:settingScene
                opacity:1
            }
        },
        State{
            name:"list"
            PropertyChanges{
                target:listscene
                opacity:1
            }
        }

    ]



}
