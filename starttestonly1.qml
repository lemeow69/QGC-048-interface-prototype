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

    Rectangle{
        id:belowheader

        color:"#404040"
        height: 390
        width:260

        QGCLabel{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 20
            anchors.leftMargin: 10
            text:               qsTr("Flight Type")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     10
        }


        QGCLabel{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 70
            anchors.leftMargin: 10
            text:               qsTr("Wall Alignment")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     10
        }
        QGCLabel{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 120
            anchors.leftMargin: 10
            text:               qsTr("Dist. from Wall (m)")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     10
        }
        QGCLabel{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 170
            anchors.leftMargin: 10
            text:               qsTr("Flight Height (m)")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     10
        }
        QGCLabel{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 220
            anchors.leftMargin: 10
            text:               qsTr("Flight Distance (m)")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     10
        }
        QGCLabel{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 270
            anchors.leftMargin: 10
            text:               qsTr("Flight Speed (m/s)")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     10
        }
        SliderSwitch{
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottomMargin: 20
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            confirmText: "Start Mission"
            onAccept:{
                QGroundControl.multiVehicleManager.activeVehicle.startMission()
            }
        }
    }

}
