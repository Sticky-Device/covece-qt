import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 700
    height: 700
    title: qsTr("Hello World")

    Board {
        id: gameBoard
        anchors.fill: parent
    }

}
