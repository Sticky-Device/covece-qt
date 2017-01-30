import QtQuick 2.0
import QtMultimedia 5.6

Rectangle {
    property int pos: 0;
    property int desired_pos: 0;
    property int player: 0;

    radius: width / 2;
    width: 20;
    height: width;
    color: '#A9C52F';

    function endMove() {
        dice.roll();
    }

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }


    Audio {
        id: pieceSound;
        source: "qrc:/audio/piece.01.mp3";
    }

    SoundEffect {
        id: playSound
        source: "qrc:/audio/piece.01.wav";
    }

    onPosChanged: ParallelAnimation {

        PropertyAnimation {
            duration: 500;
            target: parent.piece;
            properties: "x";
            to: parent.fields[pos].x + parent.fields[pos].width / 2 - width / 2;
            easing.type: Easing.InOutExpo;
        }
        PropertyAnimation {
            duration: 500;
            target: parent.piece;
            properties: "y";
            to: parent.fields[pos].y + parent.fields[pos].height / 2 - height/ 2;
            easing.type: Easing.InOutExpo;
        }
        onStarted: {
            console.log("Playing sound for " + pos);
            playSound.play();
            //pieceSound.play();
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
