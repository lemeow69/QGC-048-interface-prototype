import QtQuick 2.5


import QtQuick                  2.12
import QtQuick.Controls         2.4
import QtQuick.Dialogs          1.3
import QtQuick.Layouts          1.12

import QtLocation               5.3
import QtPositioning            5.3
import QtQuick.Window           2.2
import QtQml.Models             2.1

import org.freedesktop.gstreamer.GLVideoItem 1.0
import "." as QGroundMain;


import QGroundControl               1.0
import QGroundControl.Airspace      1.0
import QGroundControl.Airmap        1.0
import QGroundControl.Controllers   1.0
import QGroundControl.Controls      1.0
import QGroundControl.FactSystem    1.0
import QGroundControl.FlightDisplay 1.0
import QGroundControl.FlightMap     1.0
import QGroundControl.Palette       1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Vehicle       1.0

Item {
    property var    _activeVehicle:             QGroundControl.multiVehicleManager.activeVehicle
    Rectangle{
        id:header
        color:"#2D2D2D"
        height:30
        width:260
        QGCLabel{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 5
            anchors.leftMargin: 5
            text:               qsTr("UAV Control Mode")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     ScreenTools.largeFontPointSize
        }
    }
    Rectangle{
        id:belowheader
        anchors.top: header.bottom
        color:"#404040"
        height:120
        width:260
        QGCLabel{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 90
            text:               _activeVehicle.armed == true ? qsTr("Armed") : qsTr("Disarm")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     ScreenTools.largeFontPointSize
        }

        QGCButton{
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 20
            anchors.leftMargin: 20
            height:50
            width:100
            text:"Disarm"
            onClicked:{
                _activeVehicle.armed = false
            }
        }
        QGCButton{
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 20
            anchors.rightMargin: 20
            height:50
            width:100
            text:"Arm"
            onClicked:{
                _activeVehicle.armed = true
            }
        }
    }
    Rectangle{
        id:header2
        color: "#2D2D2D"
        height:30
        width:260
        anchors.top: belowheader.bottom
        QGCLabel{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 5
            anchors.leftMargin: 5
            text:               qsTr("Mission Setup & Commands")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     ScreenTools.largeFontPointSize
        }
    }
    QGCTabBar {
        id:             bar
        width:          260

        anchors.top: header2.bottom
       // anchors.right: parent.right


        QGCTabButton {
            id:testtabtutton1

            //text:       qsTr("Setup")

            Text {
                color: testtabtutton1.checked ? qgcPal.buttonHighlightText : qgcPal.buttonText
                text: qsTr("Setup")
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin:19
            }
            QGCColoredImage {
                id:                     test1
                height:30
                width:30
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 16
                source: "qrc:/InstrumentValueIcons/airplane.svg"
                color:  testtabtutton1.checked ? qgcPal.buttonHighlightText : qgcPal.buttonText
            }

        }
        QGCTabButton {
            id:testtabtutton2
            Text{
                color: testtabtutton2.checked ? qgcPal.buttonHighlightText : qgcPal.buttonText
                text: qsTr("Take-off")
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin:16
            }
            QGCColoredImage{
                height:30
                width:30
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 16
                color: testtabtutton2.checked ? qgcPal.buttonHighlightText : qgcPal.buttonText
                source: "qrc:/InstrumentValueIcons/share.svg"
            }
        }
        QGCTabButton {

            id:testtabtutton3
            Text{
                color: testtabtutton3.checked ? qgcPal.buttonHighlightText : qgcPal.buttonText
                text: qsTr("Start")
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin:19
            }
            QGCColoredImage{
                height:30
                width:30
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 16
                color: testtabtutton3.checked ? qgcPal.buttonHighlightText : qgcPal.buttonText
                source: "qrc:/InstrumentValueIcons/play-outline.svg"
            }
        }
        QGCTabButton {
            id:testtabtutton4

            Text{
                color: testtabtutton4.checked ? qgcPal.buttonHighlightText : qgcPal.buttonText
                text: qsTr("Land")
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin:19
            }
            QGCColoredImage{
                height:30
                width:30
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 16
                color: testtabtutton4.checked ? qgcPal.buttonHighlightText : qgcPal.buttonText
                source: "qrc:/InstrumentValueIcons/arrow-base-down.svg"
            }
        }
    }
    property var pages:  ["qrc:/qml/Setuptestonly1.qml", "qrc:/qml/Takeofftestonly1.qml","qrc:/qml/starttestonly1.qml","qrc:/qml/landtestonly1.qml"]
Rectangle{
    anchors.top: bar.bottom
    anchors.right: parent.right
    width:260
    height:360
    Loader {
        id:             joyLoader
        source:         pages[bar.currentIndex]
       // width:          parent.width
        width: 260
        anchors.fill: parent //
        //anchors.top:    bar.bottom
       // anchors.top: parent.top
        //anchors.right: parents.right //
        //anchors.leftMargin: 300//
    }
}
}
