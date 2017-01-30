import QtQuick 2.0
import QtQuick.Controls 2.0
import QtMultimedia 5.6

Text {
    property int result: -1;
    property var board;

    FontLoader { id: localFont; source: "qrc:/foundation-icons.ttf" }

    //anchors.centerIn: parent;
    text: unicodeDiceChar(result);
    font { family: localFont.name; pixelSize: 100; capitalization: Font.Capitalize }

    width: 20;
    height: width;

    color: '#F7EEBB';

    Audio {
        id: diceRollSound;
        playlist: Playlist {
            id: diceRollSounds;
            playbackMode: 'CurrentItemOnce';
            PlaylistItem { source: "qrc:/audio/dice.01.mp3"; }
            PlaylistItem { source: "qrc:/audio/dice.02.mp3"; }
            PlaylistItem { source: "qrc:/audio/dice.03.wav"; }
        }
    }

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    function roll() {
        result = getRandomInt(1, 6);
        diceRollSounds.currentIndex = getRandomInt(0, 2);
        diceRollSound.play();
    }

    function unicodeDiceChar(res) {
        switch (res) {
        case 1:
            return "\uf13c";
        case 2:
            return "\uf13f";
        case 3:
            return "\uf13e";
        case 4:
            return "\uf13b";
        case 5:
            return "\uf13a";
        case 6:
            return "\uf13d";
        default:
            return "ha";
        }

    }


}
