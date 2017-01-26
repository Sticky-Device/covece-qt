import QtQuick 2.0

Item {
    property int result: -1;

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    function roll() {
        result = getRandomInt(1, 6);
    }

    Text {
        text: result
    }
}
