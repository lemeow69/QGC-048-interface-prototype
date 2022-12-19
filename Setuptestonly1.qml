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
    property double distfromwall1:0
    property double flightheight1:0
    property double flightdistance1:0
    property int chainage1: 0
    Rectangle{
        id:belowheader

        color:"#404040"
        height: 390
        width: 260
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
        QGCTabButton{
            id:flighttype1
            height:30
            width:50
            anchors.right: flighttype2.left
            anchors.top: flighttype2.top
            anchors.bottom: flighttype2.bottom
        QGCLabel{
            color: flighttype1.checked ? "black" : "white"
            text:"One-way"
            anchors.centerIn: parent
        }

            onClicked:{

            }
        }
        QGCTabButton{
            id:flighttype2
            height:30
            width:50
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 20
            anchors.leftMargin: 180
        QGCLabel{
            color: flighttype2.checked ? "black" : "white"
            text:"Return"
            anchors.centerIn: parent
            //todo checked ? color : color
        }
            onClicked:{

                }


            }
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
        QGCTabButton{
            id:flighttype3
            height:30
            width:50
            anchors.right: flighttype4.left
            anchors.top: flighttype4.top
            anchors.bottom: flighttype4.bottom
           // text: "Left Wall"
            //text.color: flighttype3.checked ? "black" : "white"
            QGCLabel{
                color: flighttype3.checked ? "black" : "white"
                text:"Left Wall"
                anchors.centerIn: parent
                //todo checked ? color : color
            }
            onClicked:{

            }
        }
        QGCTabButton{
            id:flighttype4
            height:30
            width:50
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 70
            anchors.leftMargin: 180
           // text: "Right Wall"
           // text.color: flighttype4.checked ? "black" : "white"
            QGCLabel{
                color: flighttype4.checked ? "black" : "white"
                text:"Right Wall"
                anchors.centerIn: parent
                //todo checked ? color : color
            }
            onClicked:{

                }


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
            id:distfromwall
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 120
            anchors.leftMargin: 180
            text:               distfromwall1
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     10
        }
        QGCButton{
           // anchors.topMargin: 120
            height:20
            width:20
            anchors.right: distfromwall.left
            anchors.top: distfromwall.top
            anchors.bottom: distfromwall.bottom
            QGCColoredImage{
                height:10
                width:10
                source:"qrc:/InstrumentValueIcons/arrow-thick-left.svg"
                anchors.centerIn: parent
            }
            onClicked:{
                distfromwall1 = distfromwall1 + 1
            }
        }
        QGCButton{
           // anchors.topMargin: 120
            height:20
            width:20
            anchors.left: distfromwall.right
            anchors.top: distfromwall.top
            anchors.bottom: distfromwall.bottom
            QGCColoredImage{
                height:10
                width:10
                source:"qrc:/InstrumentValueIcons/arrow-thick-right.svg"
                anchors.centerIn: parent
            }
            onClicked:{
                distfromwall1 = distfromwall1 - 1
            }
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
            id:flightheight
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 170
            anchors.leftMargin: 180
            text:               flightheight1
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     10
        }

        QGCButton{
           // anchors.topMargin: 120
            height:20
            width:20
            anchors.right: flightheight.left
            anchors.top: flightheight.top
            anchors.bottom: flightheight.bottom
            QGCColoredImage{
                height:10
                width:10
                source:"qrc:/InstrumentValueIcons/arrow-thick-left.svg"
                anchors.centerIn: parent
            }
            onClicked:{
                flightheight1 = flightheight1 + 1
            }
        }
        QGCButton{
           // anchors.topMargin: 120
            height:20
            width:20
            anchors.left: flightheight.right
            anchors.top: flightheight.top
            anchors.bottom: flightheight.bottom
            QGCColoredImage{
                height:10
                width:10
                source:"qrc:/InstrumentValueIcons/arrow-thick-right.svg"
                anchors.centerIn: parent
            }
            onClicked:{
                flightheight1 = flightheight1 - 1
            }
        }
        QGCLabel{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 220
            anchors.leftMargin: 10
            text:               qsTr("Flight Distance (m)")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
           // font.pointSize:     ScreenTools.largeFontPointSize
            font.pointSize:10
        }
        QGCLabel{
            id:flightdistance
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 220
            anchors.leftMargin: 180
            text:               flightdistance1
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     10
        }

        QGCButton{
           // anchors.topMargin: 120
            height:20
            width:20
            anchors.right: flightdistance.left
            anchors.top: flightdistance.top
            anchors.bottom: flightdistance.bottom
            QGCColoredImage{
                height:10
                width:10
                source:"qrc:/InstrumentValueIcons/arrow-thick-left.svg"
                anchors.centerIn: parent
            }
            onClicked:{
                flightdistance1 = flightdistance1 + 1
            }
        }
        QGCButton{
           // anchors.topMargin: 120
            height:20
            width:20
            anchors.left: flightdistance.right
            anchors.top: flightdistance.top
            anchors.bottom: flightdistance.bottom
            QGCColoredImage{
                height:10
                width:10
                source:"qrc:/InstrumentValueIcons/arrow-thick-right.svg"
                anchors.centerIn: parent
            }
            onClicked:{
                flightdistance1 = flightdistance1 - 1
            }
        }
        QGCLabel{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 270
            anchors.leftMargin: 10
            text:               qsTr("Chainage Number")
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
           // font.pointSize:     ScreenTools.largeFontPointSize
            font.pointSize:10
        }
        QGCLabel{
            id:chainage
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 270
            anchors.leftMargin: 180
            text:               chainage1
            font.family:        ScreenTools.demiboldFontFamily
            color:              "white"
            font.pointSize:     10
        }

        QGCButton{
           // anchors.topMargin: 120
            height:20
            width:20
            anchors.right: chainage.left
            anchors.top: chainage.top
            anchors.bottom: chainage.bottom
            QGCColoredImage{
                height:10
                width:10
                source:"qrc:/InstrumentValueIcons/arrow-thick-left.svg"
                anchors.centerIn: parent
            }
            onClicked:{
                chainage1 = chainage1 + 1
            }
        }
        QGCButton{
           // anchors.topMargin: 120
            height:20
            width:20
            anchors.left: chainage.right
            anchors.top: chainage.top
            anchors.bottom: chainage.bottom
            QGCColoredImage{
                height:10
                width:10
                source:"qrc:/InstrumentValueIcons/arrow-thick-right.svg"
                anchors.centerIn: parent
            }
            onClicked:{
                chainage1 = chainage1 - 1
            }
        }
        QGCButton{
            text:"Set Mission"
            width:100
            height:40
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 20
            anchors.leftMargin: 65
            onClicked:{

            }
        }
    }


