import QtQuick 2.0

Rectangle {
    property int pos: 0
    radius: width / 4
    width: 40
    height: 40
    color: "#fafafa"

    Behavior on color { ColorAnimation {} }

    Text {
        anchors.centerIn: parent
        text: pos
    }


    MouseArea {
        anchors.fill: parent;

        onPressed: {
            parent.color = 'blue';
        }

        onReleased: {
            parent.color = '#fafafa';

        }
    }
}
