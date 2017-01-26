import QtQuick 2.0

Rectangle {
    property int pos: 0;
    property int desired_pos: 0;
    property int player: 0;

    radius: width / 2;
    width: 20;
    height: width;
    color: 'red';

    function endMove() {
        dice.roll();
    }

    onPosChanged: ParallelAnimation {
        PropertyAnimation {
            target: parent.piece;
            properties: "x";
            to: parent.fields[pos].x + parent.fields[pos].width / 2 - width / 2;
            easing.type: Easing.InOutExpo;
        }
        PropertyAnimation {
            target: parent.piece;
            properties: "y";
            to: parent.fields[pos].y + parent.fields[pos].height / 2 - height/ 2;
            easing.type: Easing.InOutExpo;
        }
        onStopped:  {
            if (pos !== desired_pos) {
                pos = (pos + 1) % 40;
            } else {
                endMove();
            }
        }
    }
}
