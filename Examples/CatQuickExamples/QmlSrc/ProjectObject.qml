﻿pragma Singleton //声明单例
import QtQuick 2.12
import QtQml 2.12


QtObject {
    id: projectobject
    objectName: "projectobject"

    property string fontFamily: "Ubuntu"

    property string resourcePath: "qrc:/Images/"

    property int currentTheme: -1

    property color appBackgroundColor: "#1F1F20"
    property color titleBackgroundColor: "#18181B"
    property color titleBottomWidthColor: "#000000"
    property color titleLogoShadowColor: "#FFFFFF"
    property color fpsgradient0Color: "#87CEFF"
    property color fpsgradient1Color: "blue"
    property color defaultShadowColor: "#3FFFFFFF"
    property color controlNameColor: "#FFFFFF"
    property color controlAuthorColor: "#9B9898"
    property color controlVersionColor: "#9B9898"
    property color defaultRectangleColor: "#2C2C2C"
    property color controlRectangleColor: "#4E4E4E"

    onCurrentThemeChanged: {
        var t = projectobject.themes.get(currentTheme)
        projectobject.appBackgroundColor = t.appBackgroundColor
        projectobject.titleBackgroundColor = t.titleBackgroundColor
        projectobject.titleBottomWidthColor = t.titleBackgroundColor
        projectobject.titleLogoShadowColor = t.titleLogoShadowColor
        projectobject.fpsgradient0Color = t.fpsgradient0Color
        projectobject.fpsgradient1Color = t.fpsgradient1Color
        projectobject.defaultShadowColor = t.defaultShadowColor
        projectobject.controlNameColor = t.controlNameColor
        projectobject.controlAuthorColor = t.controlAuthorColor
        projectobject.controlVersionColor= t.controlVersionColor
        projectobject.defaultRectangleColor = t.defaultRectangleColor
        projectobject.controlRectangleColor = t.controlRectangleColor
    }

    property ListModel themes: ListModel {
        ListElement {
            name: "Black"
            appBackgroundColor: "#1F1F20"
            titleBackgroundColor: "#18181B"
            titleBottomWidthColor: "#000000"
            titleLogoShadowColor: "#3FFFFFFF"
            fpsgradient0Color: "#9B9898"
            fpsgradient1Color: "#4E4E4E"
            defaultShadowColor: "#3FFFFFFF"
            controlNameColor: "#FFFFFF"
            controlAuthorColor: "#9B9898"
            controlVersionColor: "#9B9898"
            controlRectangleColor: "#4E4E4E"
            defaultRectangleColor: "#2C2C2C"
        }
    }

    property var defaultControl: {
        "control": [

            {
                "name": "ImageFlipable",
                "author" : "GrayCatQt",
                "version" : "1.0",
                "logoSource": projectobject.getCurrentResourcePath() + "ImageFlipable.png",
                "qmlSource": projectobject.getProjectQmlControlPath() + "DemoImageFlipable.qml",
                "index": 0
            },
            {
                "name": "ImageFlicker",
                "author" : "GrayCatQt",
                "version" : "1.0",
                "logoSource": projectobject.getCurrentResourcePath() + "ImageFlicker.png",
                "qmlSource": projectobject.getProjectQmlControlPath() + "DemoImageFlicker.qml",
                "index": 1
            },
            {
                "name": "ImageFlickerGradient",
                "author" : "GrayCatQt",
                "version" : "1.0",
                "logoSource": projectobject.getCurrentResourcePath() + "ImageFlickerGradient.png",
                "qmlSource": projectobject.getProjectQmlControlPath() + "DemoImageFlickerGradient.qml",
                "index": 2
            },
            {
                "name": "ImageMove",
                "author" : "GrayCatQt",
                "version" : "1.0",
                "logoSource": projectobject.getCurrentResourcePath() + "ImageMove.png",
                "qmlSource": projectobject.getProjectQmlControlPath() + "DemoImageMove.qml",
                "index": 3
            },
            {
                "name": "ImageScale",
                "author" : "GrayCatQt",
                "version" : "1.0",
                "logoSource": projectobject.getCurrentResourcePath() + "ImageScale.png",
                "qmlSource": projectobject.getProjectQmlControlPath() + "DemoImageScale.qml",
                "index": 4
            },
            {
                "name": "Marquee",
                "author" : "GrayCatQt",
                "version" : "1.0",
                "logoSource": projectobject.getCurrentResourcePath() + "Marquee.png",
                "qmlSource": projectobject.getProjectQmlControlPath() + "DemoMarquee.qml",
                "index": 5
            },
            {
                "name": "TextOneByOneShow",
                "author" : "GrayCatQt",
                "version" : "1.0",
                "logoSource": projectobject.getCurrentResourcePath() + "TextOneByOneShow.png",
                "qmlSource": projectobject.getProjectQmlControlPath() + "DemoTextOneByOneShow.qml",
                "index": 6
            },
            {
                "name": "CatRectangle",
                "author" : "GrayCatQt",
                "version" : "1.0",
                "logoSource": projectobject.getCurrentResourcePath() + "CatRectangle.png",
                "qmlSource": projectobject.getProjectQmlControlPath() + "DemoCatRectangle.qml",
                "index": 7
            },
            {
                "name": "QParentQrenCode",
                "author" : "GrayCatQt",
                "version" : "1.0",
                "logoSource": projectobject.getCurrentResourcePath() + "QrenCode.svg",
                "qmlSource": projectobject.getProjectQmlControlPath() + "DemoQParentQrenCode.qml",
                "index": 8
            },
            {
                "name": "CatCalendar",
                "author" : "GrayCatQt",
                "version" : "1.0",
                "logoSource": projectobject.getCurrentResourcePath() + "CatCalendar.png",
                "qmlSource": projectobject.getProjectQmlControlPath() + "DemoCatCalendar.qml",
                "index": 9
            },
            /*{
                "name": "Image3dRotation",
                "author" : "Qt",
                "version" : "1.0",
                "logoSource": projectobject.getCurrentResourcePath() + "3drotation.svg",
                "index": 1
            }*/
        ]
    }

    Component.onCompleted: {
        projectobject.currentTheme = 0
        console.log("themes: " + getCurrentThemesName());
    }

    /*
     * 获取当前样式名
    */
    function getCurrentThemesName()
    {
        return projectobject.themes.get(currentTheme).name
    }
    /*
     * 获取当前样式皮肤路径
    */
    function getCurrentResourcePath()
    {
        return projectobject.resourcePath +
                projectobject.themes.get(currentTheme).name +
                "/"
    }

    function getProjectQmlControlPath()
    {
        return "qrc:/ControlDemos/"
    }

}
