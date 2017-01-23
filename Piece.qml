import QtQuick 2.0

import "BoardScripts.js" as BoardScripts

Rectangle {
    property int pos: 0;
    property int player: 0;
    radius: width / 2;
    width: 20;
    height: width;
    color: 'red';

    onPosChanged: {
        console.log(parent)
       // x = parent.fields[pos].x
        //y = parent.fields[pos].y
    }
}
