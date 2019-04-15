import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle{
        id: mainPlayground
        color: "light gray"
        anchors.fill: parent
        anchors.margins: 10

        focus: true

        Keys.onLeftPressed: playRect.x -= 10
        Keys.onRightPressed: playRect.x += 10
        Keys.onUpPressed: playRect.y -= 10
        Keys.onDownPressed: playRect.y += 10

        Rectangle{
            property int clickNum: 0
            id: playRect

            width: 100
            height: 100

            radius: 10

            x:10
            y:10


            MouseArea{
                anchors.fill: parent
                onClicked: {
                    parent.clickNum += 1
                    parent.rotation += 10
                }
            }
            Text {
                id: clickText
                text: parent.clickNum
                anchors.centerIn: parent
            }
        }

        Text {
            id: middleText
            text: qsTr("Press arrow keys to move the rectangle")
            anchors.centerIn: parent
        }
        Text {
            id: middleTextII
            text: qsTr("Click the rectangle to rotate it")
            anchors.top: middleText.bottom
            anchors.horizontalCenter: middleText.horizontalCenter
        }
        Text {
            id: middleTextIII
            text: qsTr("Click this text to reset rectangle")
            anchors.top: middleTextII.bottom
            anchors.horizontalCenter: middleTextII.horizontalCenter
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    playRect.x = 10
                    playRect.y = 10
                    playRect.rotation = 0
                    playRect.clickNum = 0
                }
            }
        }


    }
}
