import Felgo 3.0
import QtQuick 2.0

Item {
    id: button
    width: 300
    height: 100

    property string text
    signal clicked()

    Text{
        font.family: gameFont.name
        color: "white"
        text:button.text
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter



    MouseArea{
        anchors.fill: parent
        onClicked: button.clicked()
        }
    }

}
