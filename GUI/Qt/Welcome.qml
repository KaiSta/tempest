import QtQuick 2.4


Text {
    text: _containerModel.get(containerList.currentRow, 2)
    font.family: "Helvetica"
    font.pointSize: 24
    color: "red"
}


