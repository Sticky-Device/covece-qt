import QtQuick 2.7
import QtQuick.Controls 2.0

Page {
    Rectangle {
        anchors.fill: parent
        border.width: 3
    }

    Dice {
        id: dice
        anchors.centerIn: parent;
    }

    property var fields;
    property var piece;
    property int roll: 0;

    Component.onCompleted: {



        function position(field) {
            var r = 250;
            var delta = Math.PI / 16;
            var x_pad = field.width + r / 30;
            var y_pad = field.height + r / 30;
            if (field.pos < 9) {
                field.x = + (x_pad + r) + r * Math.cos(-Math.PI / 2 - delta * field.pos);
                field.y = + (y_pad + r) + r * Math.sin(-Math.PI / 2 - delta * field.pos);
            } else if (field.pos === 9){
                field.x = 0;
                field.y = + (y_pad + r);
            } else if (field.pos < 19) {
                field.x = - (x_pad + r) + r * Math.cos(0 - delta * (field.pos - 10));
                field.y = + (y_pad + r) + r * Math.sin(0 - delta * (field.pos - 10));
            } else if (field.pos === 19) {
                field.x = - (r + x_pad)
                field.y = 0;
            } else if (field.pos < 29) {
                field.x = - (x_pad + r) + r * Math.cos(Math.PI / 2 - delta * (field.pos - 20));
                field.y = - (y_pad + r) + r * Math.sin(Math.PI / 2 - delta * (field.pos - 20));
            } else if (field.pos === 29) {
                field.x = 0;
                field.y = - (r + y_pad);
            } else if (field.pos < 39) {
                field.x = + (x_pad + r) + r * Math.cos(Math.PI - delta * (field.pos - 30));
                field.y = - (y_pad + r) + r * Math.sin(Math.PI - delta * (field.pos - 30));
            } else if (field.pos === 39) {
                field.x = + (r + x_pad);
                field.y = 0;
            }

            field.x -= field.width / 2;
            field.y -= field.height / 2;
            field.x += r + 100
            field.y += r + 100;
        }
        fields = [];
        var piece_constructor = Qt.createComponent("Piece.qml");
        var component = Qt.createComponent("Field.qml");
        for (var i = 0; i < 40; ++i) {
            var instance = component.createObject(gameBoard, {"pos": i});
            position(instance);
            fields[i] = instance;
        }

        piece = piece_constructor.createObject(gameBoard, {"player": 0, "pos": 0});
        dice.roll();
    }
}
