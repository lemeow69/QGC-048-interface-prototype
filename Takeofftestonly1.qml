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


    property var guidedValueSlider
    property var confirmDialog

    Rectangle{
        id:belowheader

        color:"#404040"
        height: 390
        width:260
        QGCLabel{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.topMargin: 10
            text:               qsTr("Take-off Mode")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     ScreenTools.largeFontPointSize
        }
/*
        QGCButton{
            height:50
            width:100
            text:"Take off"
            //anchors.centerIn: parent
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 65
            anchors.bottomMargin: 20
            onClicked:{
                _activeVehicle.guidedModeTakeoff(takeoffslidervalue1.value)


            }
        }

*/
        SliderSwitch{
            anchors.bottom: parent.bottom
            anchors.left:  parent.left
            anchors.right: parent.right
            anchors.bottomMargin: 20
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            confirmText: "Take-off"
            onAccept:{
                _activeVehicle.guidedModeTakeoff(takeoffslidervalue1.value)
            }
        }

        QGCSlider{
            id:takeoffslidervalue1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.topMargin: 100
            minimumValue: 0
            maximumValue:10
        }
        QGCLabel{

            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.topMargin: 130

            text:               takeoffslidervalue1.value.toFixed(1)
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     ScreenTools.largeFontPointSize
        }
    }

}
