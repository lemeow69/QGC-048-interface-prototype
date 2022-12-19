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
        id:belowheader

        color:"#404040"
        height: 390
        width:260

        QGCLabel{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 20
            anchors.leftMargin: 20
            text:               qsTr("UAV Altitude (m)")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     ScreenTools.largeFontPointSize
        }

        QGCLabel{
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 20
            anchors.rightMargin: 20
           // text: QGroundControl.gpsRtk.currentAltitude.rawValue//
            text: _activeVehicle.altitudeRelative.rawValue.toFixed(2)

           // text: _activeVehicle._rollRateFact
           // text:               qsTr("UAV Control Mode")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     ScreenTools.largeFontPointSize
        }

       /* QGCButton{
            height:50
            width:100
            text:"Land"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 75
            anchors.bottomMargin: 20
            onClicked:{
                _activeVehicle.guidedModeLand()
            }
        }*/
        SliderSwitch{
            confirmText:"Land"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottomMargin: 20
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            onAccept:{
                _activeVehicle.guidedModeLand()
            }
        }
    }

}

