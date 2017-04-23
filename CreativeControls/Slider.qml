import QtQuick 2.6
import CreativeControls 1.0

// Simple slider : values are betweeen 0. and 1.
Rectangle
{
    id: slider

    color : Styles.detail
    border.width : handleWidth
    border.color : handleColor

    radius : Styles.cornerRadius

    // slider width
    property real sliderWidth : 100

    // handle width and color
    property real handleWidth : Math.min(slider.width,slider.height) * 1./15//bVertical ? height / 20 : width / 20
    property color handleColor: Styles.base

    // vertical (Qt.Vertical) or horizontal (Qt.Horizontal) slider
    property int orientation : Qt.Vertical //Qt.Horizontal

    // the value is between 0 and 1.
    property real value : initialValue;
    property real initialValue : 0.5

    property bool __updating: false

    // value mapping
    property var customMap: function(val){return val;}
    property var linearMap: function()
    {
        var mappedVal = 0.;
        var borderW = border.width;

        if(orientation == Qt.Vertical)
            mappedVal = 1.0 - (handle.y - borderW) / (valueRange.y - valueRange.x);
        else if(orientation == Qt.Horizontal)
            mappedVal = (handle.x - borderW) /  (valueRange.y - valueRange.x);

        return Utils.clamp(mappedVal.toFixed(2),0.,1.);
    }

    // slider value range
    property point valueRange : orientation == Qt.Vertical?
                                    Qt.point(border.width + handleWidth/2.,
                                             slider.height - border.width - handleWidth/2.)
                                  : Qt.point(border.width + handleWidth/2.,
                                             slider.width - border.width - handleWidth/2.)

    // function called when updating the value from outside
    function updateValue()
    {
        // TODO use a function instead so that one can use linear, or log, or whatever mapping.
        if(!__updating)
        {
            slider.value = linearMap();
        }
    }

    // called when a mouse event (onPressed / onPositionChanged) is detected
    // moves the slider's handle to the mouse position
    function moveHandle(mouseX,mouseY)
    {

        if(orientation == Qt.Vertical)
        {
            handle.y = Utils.clamp(mouseY,
                                   valueRange.x , valueRange.y ) - handleWidth/2;
        }
        else
        {
            handle.x = Utils.clamp(mouseX,
                                   valueRange.x ,valueRange.y ) - handleWidth/2;
        }

        // __updating = false;
    }

    Rectangle
    {
        id: handle

        anchors.verticalCenter: orientation == Qt.Horizontal? parent.verticalCenter : undefined
        anchors.horizontalCenter: orientation == Qt.Vertical? parent.horizontalCenter : undefined

        color :  handleColor

        width : orientation == Qt.Vertical? slider.width : handleWidth
        onWidthChanged: updateHandle();

        height : orientation == Qt.Vertical? handleWidth : slider.height
        onHeightChanged: updateHandle();

        radius : Styles.cornerRadius

        x: orientation == Qt.Horizontal ? (1. - initialValue) * (valueRange.y - valueRange.x) + valueRange.x - handleWidth/2.: 0
        onXChanged : {if(!resize)slider.value = linearMap();}

        Behavior on x {enabled : handle.ease; NumberAnimation {easing.type : Easing.OutQuint}}

        y : orientation == Qt.Vertical ? (1. - initialValue) * (valueRange.y - valueRange.x) + valueRange.x - handleWidth/2.: 0
        onYChanged : {if(!resize)slider.value = linearMap();}

        Behavior on y {enabled : handle.ease; NumberAnimation {easing.type : Easing.OutQuint}}

        property bool ease : true
        property bool resize : false

        function updateHandle()
        {
            ease = false;
            resize = true;
            x = orientation == Qt.Horizontal ?
                        (1. - slider.value) * (valueRange.y - valueRange.x) + valueRange.x - handleWidth/2.
                      : 0 ;
            y = orientation == Qt.Vertical ?
                        (1. - slider.value) * (valueRange.y - valueRange.x) + valueRange.x - handleWidth/2.
                      : 0
        }
    }

    MouseArea
    {
        anchors.fill : parent

        onPressed :
        {
            __updating = true;
            handle.ease = true;
            handle.resize = false;
            moveHandle(mouseX,mouseY);
            //  slider.value = linearMap();
        }

        onPositionChanged: {
            handle.ease = false;
            moveHandle(mouseX,mouseY);
            //   slider.value = linearMap();
        }
        onReleased:
        {
            __updating = false;
        }
    }

    // label
    property alias text : label.text
    Text
    {
        id: label
        text : value
        anchors.centerIn: slider

        font.bold: true
        color : handleColor
    }
}
