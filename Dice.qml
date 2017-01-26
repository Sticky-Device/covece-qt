import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    property int result: -1;
    property var board;

    width: 40;
    height: width;

    radius: width / 4;
    color: 'red';

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    function roll() {
        result = getRandomInt(1, 6);
    }

    Text {
        anchors.centerIn: parent;
        color: 'white';
        text: result;
        font.pointSize: 10;
    }
}
