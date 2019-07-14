import Felgo 3.0
import QtQuick 2.0
import GameScoreType 1.0

GameWindow {
    id: gameWindow


    screenWidth: 640
    screenHeight: 960


    onSplashScreenFinished: scene.startWindowShow()


    EntityManager {
        id: entityManager
        entityContainer: gameArea
    }


    FontLoader {
        id: gameFont
        source: "../assets/fonts/text.ttf"
    }


    Scene {
        id: scene


        width: 320
        height: 480


        property int score
        property int variety: 0
        signal returnStart


        BackgroundImage {
            id: juicybackground
            source: "../assets/JuicyBackground.png"
            anchors.centerIn: scene.gameWindowAnchorItem
        }
        GameSound {
            id: gamesound
        }

        GameScore{
            id:gamescore
        }

        Image {
            id: grid
            source: "../assets/Grid.png"
            width: 258
            height: 378
            anchors.horizontalCenter: scene.horizontalCenter
            anchors.bottom: scene.bottom
            anchors.bottomMargin: 92
        }
        Text {
            font.family: gameFont.name
            font.pixelSize: 23
            color: "yellow"
            text: " "
            anchors.horizontalCenter: parent.horizontalCenter
            y: 400
        }

        Text {
            font.family: gameFont.name
            font.pixelSize: 20
            color: "green"
            text: scene.score

            anchors.horizontalCenter: parent.horizontalCenter
            y: 440
        }

        Keys.onPressed: {

            if (event.key === Qt.Key_Control) {
                event.accepted = true
                chancerAnimation.running = 0
                chance.enabled = false
                gameArea.removeChanceLink()
                chance.color = "white"
            }
        }

        Rectangle {
            id: chance
            width: 60
            height: 25
            enabled: false
            x: 0
            y: 425
            color: "white"

            Text {
                text: "机会"
                font.family: aboutFont.name
                font.pixelSize: 12
                anchors.centerIn: parent
                color: "grey"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    chancerAnimation.running = 0
                    chance.enabled = false
                    gameArea.removeChanceLink()
                    chance.color = "white"
                }
            }
            Keys.onPressed: {
                if (envent.key === Qt.Key_Control) {
                    chancerAnimation.running = 0
                    chance.enabled = false
                    gameArea.removeChanceLink()
                    chance.color = "white"
                }
            }
        }
        SequentialAnimation {
            id: chancerAnimation
            running: false
            loops: Animation.Infinite
            PropertyAnimation {
                target: chance
                property: "color"
                from: "yellow"
                to: "white"
                duration: 1000
            }
            PropertyAnimation {
                target: chance
                property: "color"
                duration: 1000
                from: "white"
                to: "yellow"
            }
        }

        FontLoader {
            id: aboutFont
            source: "../assets/fonts/HoneyLight.ttf"
        }

        Text {
            id: returnstart

            text: "返回"
            font.family: aboutFont.name
            font.pixelSize: 13
            x: 0
            y: 450
            color: "white"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    scene.returnStart()
                }
            }

            SequentialAnimation on color {
                loops: Animation.Infinite
                PropertyAnimation {
                    to: "#878787"
                    duration: 500
                }
                PropertyAnimation {
                    to: "black"
                    duration: 500
                }
            }
        }

        onReturnStart: {
            scene.startWindowShow()
        }


        GameArea {
            id: gameArea
            anchors.horizontalCenter: scene.horizontalCenter
            y: 20
            blockSize: 30
            onInitialize: reduceBloodTimer.start()
            onGameOver: {
                gameOverWindow.show()
                gameArea.enabled = false
                reduceBloodTimer.stop()
            }
            onChance: {
                chance.enabled = 1
                chancerAnimation.running = true
            }
            onPairingSuccess: {

                if (timeBar.blood + level * 3.5 < timeBar.height) {
                    timeBar.blood += level * 3.5
                } else {
                    timeBar.blood = timeBar.height
                }
            }
            onCalculatescore: {
                scene.score = grade.calculate(totalscore, levell)
                console.log(scene.score)
            }

        }

        Timer {
            id: reduceBloodTimer
            repeat: true
            interval: 2000
            onTriggered: {
                timeBar.blood -= 7
            }
        }


        TimeBar {
            id: timeBar
            anchors.verticalCenter: grid.verticalCenter
            anchors.right: grid.left
            width: 9
            height: gameArea.height * 2 / 3
            onBloodEmpty: {
                gameOverWindow.show()
                gameArea.enabled = false
                reduceBloodTimer.stop()
            }
        }
        GameOverWindow {
            id: gameOverWindow
            y: 120
            opacity: 0
            anchors.horizontalCenter: scene.horizontalCenter
            onNewGameClicked: {
                scene.startGame()
                gameOverWindow.hide()
            }
            onReturnStartMenue: {
                scene.startWindowShow()
            }
        }

        StartWindow {
            id: startwindow
            anchors.horizontalCenter: scene.horizontalCenter
            anchors.fill: parent
            onSimpleClicked: {
                gamesound.playMoveBlock()
                scene.variety = 0
                juicybackground.source = "../assets/JuicyBackground.png"
                scene.startGame()
            }

            onAboutClicked: {
                aboutGame.show()
                startwindow.opacity = 0
            }

            onSetClicked: {
                settingwindow.show()
                startwindow.opacity = 0
            }
            onContinueClicked: {
                gamesound.playMoveBlock()
                scene.variety = 0
                juicybackground.source = "../assets/JuicyBackground.png"
                scene.startGame()
                startwindow.readstart()
            }
        }

        SettingWindow{
            id:settingwindow
            anchors.fill: parent
            onHome1: {
                scene.startWindowShow()
                settingwindow.hide()
            }


        }

        About {
            id: aboutGame
            anchors.fill: parent
            onHome: {
                scene.startWindowShow()
                aboutGame.hide()
            }
        }

        function startGame() {
            gamesound.playStart1()

            chance.opacity = 1
            gameArea.enabled = true
            gameArea.opacity = 1
            console.log(scene.variety)
            gameArea.initializeField(scene.variety)
            console.log(scene.variety)
            scene.score = 0

            chancerAnimation.running = 0
            chance.enabled = false
            chance.color = "white"

            timeBar.blood = timeBar.height * 2 / 3
            startwindow.startWindowHide()
            grid.opacity = 1
            juicybackground.opacity = 1
            timeBar.opacity = 1
        }
        function startWindowShow() {
            gamesound.playStart()

            chance.opacity = 0
            startwindow.opacity = 1
            startwindow.enabled = 1
            gameArea.opacity = 0
            grid.opacity = 0
            juicybackground.opacity = 0
            timeBar.opacity = 0
        }
        //读取游戏
        function readstart(){
            gameOverWindow.hide()
            gameArea.initializeField()
            gameWindow.score = gameScore.score
    }
}
}
