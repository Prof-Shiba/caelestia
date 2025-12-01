import qs.components
import qs.services
import qs.config
import qs.utils
import QtQuick

Item {
    id: root
    anchors.centerIn: parent
    implicitWidth: icon.implicitWidth
    implicitHeight: icon.implicitHeight

    property string imagePath: ""

    Image {
        id: icon
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        asynchronous: true
        source: root.imagePath
        fillMode: Image.PreserveAspectFit
        sourceSize.width: 99
        sourceSize.height: 99
    }
}
