import Felgo 3.0
import QtQuick 2.0

EntityBase {
    id: block
    entityType: "block"

    // each block knows its type and its position on the field
    property int type
    property int row
    property int column
    property int chances: 0

    // emit a signal when block is clicked
    signal clicked(int row, int column, int type)

    onChancesChanged: {
        if (chances === 1)
            chance.opacity = 1
        chance1.opacity = 1
    }

    // show different images for block types
    Image {
        id: image
        anchors.fill: parent
        source: {
            if (type == 0)
                return "../assets/fruits/Apple.png"
            else if (type == 1)
                return "../assets/fruits/Banana.png"
            else if (type == 2)
                return "../assets/fruits/Orange.png"
            else if (type == 3)
                return "../assets/fruits/Pear.png"
            else if (type == 4)
                return "../assets/fruits/BlueBerry.png"
            else if (type == 5)
                return "../assets/fruits/pg.png"
            else if (type == 6)
                return "../assets/fruits/cm.png"
            else if (type == 7)
                return "../assets/fruits/yt.png"
            else if (type == 8)
                return "../assets/fruits/Coconut.png"
            else if (type == 9)
                return "../assets/fruits/Lemon.png"
            else if (type == 10)
                return "../assets/fruits/ss.png"
            else if (type == 11)
                return "../assets/fruits/WaterMelon.png"

        }

        Rectangle {
            id: chance
            opacity: 0
            width: parent.width
            height: parent.height / 12
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            color: "white"
        }
        SequentialAnimation {
            id: chancerAnimation
            running: true
            loops: Animation.Infinite
            PropertyAnimation {
                target: chance
                property: "color"
                from: "blue"
                to: "white"
                duration: 1000
            }
            PropertyAnimation {
                target: chance
                property: "color"
                duration: 1000
                from: "white"
                to: "blue"
            }
        }

        Rectangle {
            id: chance1
            opacity: 0
            width: parent.width / 12
            height: parent.height

            color: "white"
        }
        SequentialAnimation {
            id: chancerAnimation1
            running: true
            loops: Animation.Infinite
            PropertyAnimation {
                target: chance1
                property: "color"
                from: "blue"
                to: "white"
                duration: 1000
            }
            PropertyAnimation {
                target: chance1
                property: "color"
                duration: 1000
                from: "white"
                to: "blue"
            }
        }
    }
    // handle click event on blocks (trigger clicked signal)
    MouseArea {
        anchors.fill: parent
        onClicked: parent.clicked(row, column, type)
    }

    Item {
        id: particleItem
        width: parent.width
        height: parent.height
        x: parent.width / 2
        y: parent.height / 2

        Particle{
            id: sparkleParticle
            fileName: "./particles/FruitySparkle.json"
        }
        opacity: 0
        visible: opacity > 0
        enabled: opacity > 0
    }

    // fade out block before removal
    NumberAnimation {
        id: fadeOutAnimation
        target: block
        property: "opacity"
        duration: 200
        from: 1.0
        to: 0

        // remove block after fade out is finished
        onStopped: {
            sparkleParticle.stop()
            //stopDraw()
            entityManager.removeEntityById(block.entityId)
        }
    }

    // animation to let blocks fall down
    NumberAnimation {
        id: fallDownAnimation
        target: block
        property: "y"
    }

    // timer to wait for other blocks to fade out
    Timer {
        id: fallDownTimer
        interval: fadeOutAnimation.duration
        repeat: false
        running: false
        onTriggered: {
            fallDownAnimation.start()
        }
    }

    // start fade out / removal of block
    function remove() {
        particleItem.opacity = 1
        sparkleParticle.start()
        fadeOutAnimation.start()
        gamesound.playFruitClear()
    }

    // trigger fall down of block
    function fallDown(distance) {
        // complete previous fall before starting a new one
        fallDownAnimation.complete()

        // move with 100 ms per block
        // e.g. moving down 2 blocks takes 200 ms
        fallDownAnimation.duration = 100 * distance
        fallDownAnimation.to = block.y + distance * block.height

        // wait for removal of other blocks before falling down
        fallDownTimer.start()
    }
}
