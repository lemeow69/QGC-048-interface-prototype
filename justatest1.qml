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
        id:header
        color:"#2D2D2D"
        height:30
        width:260
        QGCLabel{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 5
            anchors.leftMargin: 5
            text:               qsTr("UAV Computer")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     ScreenTools.largeFontPointSize
        }
    }
    Rectangle{
        id:belowheader
        anchors.top: header.bottom
        color:"#404040"
        height:70
        width:260
        QGCButton{
           anchors.left: parent.left
           anchors.top: parent.top
           anchors.topMargin: 10
           anchors.leftMargin: 20

            height:50
            width:100
            text:"Start"
        }
        QGCButton{
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.rightMargin: 20
            height:50
            width:100
            text:"Restart"
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
        text:               qsTr("Camera Settings")
        font.family:        ScreenTools.demiboldFontFamily
        color:              "white"
        font.pointSize:     ScreenTools.largeFontPointSize
    }
}
Rectangle{
    anchors.top: header2.bottom
    color: "#404040"
    width:260
    height:480

    QGCLabel{
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 5
        anchors.leftMargin: 5
        text:               qsTr("Shutter Speed (s)")
        font.family:        ScreenTools.demiboldFontFamily
        color:              "white"
        font.pointSize:     ScreenTools.largeFontPointSize
    }
    //
    QGCSlider{

        anchors.top: parent.top
        anchors.left: parent.left

        anchors.right: parent.right
        //anchors.bottom: parent.bottom

        anchors.topMargin: 60 //60
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        minimumValue:0
        maximumValue: 10

        id:slider1
    }
    QGCLabel{
        anchors.top: slider1.bottom
        text: slider1.value.toFixed(0)
        anchors.leftMargin: 10
        font.family:        ScreenTools.demiboldFontFamily
        color:              "white"
        font.pointSize:     ScreenTools.largeFontPointSize
    }
//
    QGCLabel{
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 140
        anchors.leftMargin: 5

        text:               qsTr("Gain")
        font.family:        ScreenTools.demiboldFontFamily
        color:              "white"
        font.pointSize:     ScreenTools.largeFontPointSize
    }
    QGCSlider{

        anchors.top: parent.top
        anchors.left: parent.left

        anchors.right: parent.right
        anchors.topMargin: 195
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        minimumValue: 0
        maximumValue: 100
        id:slider2
    }
    QGCLabel{
        anchors.top: slider2.bottom
        text: slider2.value.toFixed(0)
        anchors.leftMargin: 10
        font.family:        ScreenTools.demiboldFontFamily
        color:              "white"
        font.pointSize:     ScreenTools.largeFontPointSize
    }
    QGCLabel{
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 290
        anchors.leftMargin: 5
        text:               qsTr("White Balance")
        font.family:        ScreenTools.demiboldFontFamily
        color:              "white"
        font.pointSize:     ScreenTools.largeFontPointSize
    }
    QGCLabel{
        anchors.top: slider3.bottom
        text: slider3.value.toFixed(0)
        anchors.leftMargin: 10
        font.family:        ScreenTools.demiboldFontFamily
        color:              "white"
        font.pointSize:     ScreenTools.largeFontPointSize
    }

    QGCSlider{

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

       // property bool displayValue: true
        minimumValue:1000
        maximumValue:10000

        anchors.topMargin: 345
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        id:slider3
    }
}
}
