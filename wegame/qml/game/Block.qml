import Felgo 3.0
import QtQuick 2.0

EntityBase{
    id:block
    entityType: "block"

    visible: y>=0

    property int type
    property int row
    property int column

    signal clicked(int row,int column,int type)

    NumberAnimation{
        id:fadeOutAnimation
        target: block
        property:"opacity"
        duration: 100
        from:1.0
        to:0

        onStopped: {
            EntityManager.removeEntityById(block.entityId)
        }
    }

    NumberAnimation{
        id:fallDownAnimation
        target: block
        property:"y"
    }

    Timer{
        id:fallDownTimer
        interval: fadeOutAnimation.duration
        repeat: false
        running: false
        onTriggered: {
            fallDownAnimation.start()
        }
    }

    function remove(){
        fadeOutAnimation.start()
    }

    function fallDown(distance){
        fallDownAnimation.complete()

        fallDownAnimation.duration = 100 * distance
        fallDownAnimation.to = block.y + distance * block.height

        fallDownTimer.start()
    }

    Image{
        anchors.fill:parent
        source: {
            if(type == 0)
                return "../../assets/fruits/Apple.png"
            else if(type == 1)
                return "../../assets/fruits/Banana.png"
            else if(type == 2)
                return "../../assets/fruits/Orange.png"
            else if(type == 3)
                return "../../assets/fruits/Pear.png"
            else if(type == 4)
                return "../../assets/fruits/BlueBerry.png"
            else
                return "../../assets/fruits/Lemon.png"
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: parent.clicked(row,column,type)
    }
}
