import QtQuick 2.7
import QtQuick.Controls 2.0
import "BoardScripts.js" as BoardScripts

Page {
    Rectangle {
        anchors.fill: parent
        border.width: 3
    }

    property var fields;
    property var piece;
    Component.onCompleted: BoardScripts.createBoard()
}
