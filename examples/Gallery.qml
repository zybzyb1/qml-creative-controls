import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import CreativeControls 1.0

Item {
    width: 900
    height: 900

    property font mainFont:
        Qt.font({
                    family: 'Monospace',
                    weight: Font.Black,
                    bold: true,
                    italic: false,
                    pointSize: 24
                })

    SwipeView
    {
        id:view

        currentIndex: 0
        anchors.fill: parent
        interactive: false

        background : Rectangle
        {
            anchors.fill : parent
            color : Styles.colorOff
        }
        Page
        {

            background : Rectangle
            {
                anchors.fill : parent
                color : "transparent"
            }

            header: Text
            {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 30
                font.family: mainFont
                font.bold : true
                color : Styles.background
                height : 100
                y : 20
                text: "Sliders"
            }

            GridLayout
            {
                anchors.horizontalCenter: parent.horizontalCenter
                rows : 4
                columns : 2
                rowSpacing: 20
                columnSpacing: 200

                AngleSlider {
                    id: angleSlider
                    Layout.column: 0
                    Layout.row: 0
                    width : 100
                    height : 100

                    Layout.alignment: Layout.Center
                }

                Text {
                    Layout.column: 0
                    Layout.row: 1
                    Layout.alignment:  Layout.Center
                    Layout.preferredWidth: 100
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    color : Styles.background
                    text: "Angle slider\n" + angleSlider.angle.toFixed(2)
                }

                AngleSlider {
                    id: angleSliderMinMax
                    Layout.column: 1
                    Layout.row: 0
                    Layout.alignment: Layout.Center

                    width: 100
                    height: 100
                    angle: 0
                    min: -120
                    max: 120
                    transform: Rotation { origin.x: 50; origin.y: 50; angle: -90}
                }
                Text {
                    Layout.column: 1
                    Layout.row: 1
                    Layout.alignment: Layout.Center
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    wrapMode : Text.WordWrap
                    Layout.preferredWidth: 200
                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    color : Styles.background
                    text: "Rotated with\nmin & max\n" + angleSliderMinMax.angle.toFixed(2)
                }

                Container
                {
                    Layout.column: 0
                    Layout.row: 2
                    Layout.alignment: Layout.Center
                    width : 300
                    height : 200

                    MultiSlider {
                        anchors.centerIn: parent
                        width : parent.width - 2 * parent.radius
                        height : parent.height - 2 * parent.radius
                        count: 6
                    }
                }

                Text {
                    Layout.column: 0
                    Layout.row: 3
                    Layout.alignment: Layout.Center
                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    color : Styles.background
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "Multi Slider"
                }

                Container
                {
                    Layout.column: 1
                    Layout.row: 2
                    Layout.alignment: Layout.Center
                    width: 150
                    height: 50
                    LogSlider
                    {
                        anchors.centerIn : parent
                        width : parent.width - 2 * parent.radius
                        height : parent.height - 2 * parent.radius
                        orientation: Qt.Horizontal
                    }
                }
                Text {
                    Layout.column: 1
                    Layout.row: 3
                    Layout.alignment: Layout.Center

                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    color : Styles.background
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "Log Slider"
                }
                /*
                RangeSlider
                {
                    Layout.column: 0
                    Layout.row: 6
                    Layout.alignment: Layout.Center
                }
                Text {
                    Layout.column: 1
                    Layout.row: 6
                    font.pointSize: 20
                    text: "Range Slider"
                }
                */
            }
        }
        Page
        {

            background : Rectangle
            {
                anchors.fill : parent
                color : "transparent"
            }
            header: Text
            {
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 30
                font.family: mainFont
                font.bold : true
                color : Styles.background
                text: "Colors"
                height : 100
                y : 20
            }

            GridLayout
            {
                rows : 3
                columns : 2
                rowSpacing: 20
                columnSpacing: 200
                anchors.horizontalCenter: parent.horizontalCenter
                Container
                {
                    Layout.column: 0
                    Layout.row: 0
                    Layout.alignment: Layout.Center

                    HSLSlider {
                        id: hslSlider

                        width: parent.width - 2 * parent.radius
                        height: parent.height - 2 * parent.radius
                        anchors.centerIn: parent
                    }
                }
                Text {
                    Layout.column: 0
                    Layout.row: 1
                    Layout.alignment: Layout.Center
                    Layout.preferredWidth: 100

                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    color : Styles.background
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "HSL Slider\n" + hslSlider.color
                }
                Container {
                    Layout.column: 1
                    Layout.row: 0
                    Layout.alignment: Layout.Center

                    DonutSlider {
                        x: parent.radius
                        y: parent.radius
                        id: hslDonutSlider
                        width: parent.width - 2 * parent.radius
                        height: parent.height - 2 * parent.radius
                        colorSpace : Qt.hsla
                    }
                }
                Text {
                    Layout.column: 1
                    Layout.row: 1
                    Layout.alignment: Layout.Center
                    Layout.preferredWidth: 100

                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    color : Styles.background
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "HSL Donut\n" + hslDonutSlider.resColor
                }
                Container {
                    Layout.column: 0
                    Layout.row: 2
                    Layout.alignment: Layout.Center

                    HSVSlider {
                        id: hsvSlider

                        width: parent.width - 2 * parent.radius
                        height: parent.height - 2 * parent.radius
                        anchors.centerIn: parent

                    }
                }
                Text {
                    Layout.column: 0
                    Layout.row: 3
                    Layout.alignment: Layout.Center
                    Layout.preferredWidth: 100
                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    color : Styles.background
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "HSV Slider\n" + hsvSlider.color
                }

                Container {

                    Layout.column: 1
                    Layout.row: 2
                    Layout.alignment: Layout.Center

                    DonutSlider {
                        x: parent.radius
                        y: parent.radius
                        id: hsvDonutSlider
                        width: parent.width - 2 * parent.radius
                        height: parent.height - 2 * parent.radius
                        colorSpace : Qt.hsva
                    }
                }
                Text {
                    Layout.column: 1
                    Layout.row: 3
                    Layout.alignment: Layout.Center
                    Layout.preferredWidth: 100
                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    color : Styles.background
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "HSV Donut\n" + hsvDonutSlider.resColor
                }

                Container{
                    Layout.column: 0
                    Layout.row: 4
                    Layout.alignment: Layout.Center

                    RGBSlider {
                        id: rgbSlider

                        width: parent.width - 2 * parent.radius
                        height: parent.height - 2 * parent.radius
                        anchors.centerIn: parent
                    }
                }
                Text {
                    Layout.column: 0
                    Layout.row: 5
                    Layout.alignment: Layout.Center
                    Layout.preferredWidth: 100

                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    color : Styles.background
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "RGB Slider\n" + rgbSlider.color
                }
                Container {
                    Layout.column: 1
                    Layout.row: 4
                    Layout.alignment: Layout.Center

                    DonutSlider {
                        x: parent.radius
                        y: parent.radius
                        id: rgbDonutSlider
                        width: parent.width - 2 * parent.radius
                        height: parent.height - 2 * parent.radius
                        colorSpace : Qt.rgba
                    }
                }
                Text {
                    Layout.column: 1
                    Layout.row: 5
                    Layout.alignment: Layout.Center
                    Layout.preferredWidth: 100
                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    color : Styles.background
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "RGB Donut\n" + rgbDonutSlider.resColor
                }


            }
        }

        Page
        {
            background : Rectangle
            {
                anchors.fill : parent
                color : "transparent"
            }
            header: Text
            {
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 30
                font.bold : true
                color : Styles.background
                text: "Graphs"
                height : 100
                y : 20
            }

            GridLayout
            {
                rowSpacing: 20
                //columnSpacing: 100
                anchors.horizontalCenter: parent.horizontalCenter

                Graph
                {
                    id: graph
                    width: 300
                    height: 200
                    Layout.column: 0
                    Layout.row: 0
                    Layout.alignment: Layout.Center

                    Timer {
                        id: tm
                        repeat: true
                        onTriggered: { graph.pushValue(0.1 + 0.8*Math.random()); }
                        running: true
                        interval: 16
                    }
                    Frame{}
                }
                Text {
                    Layout.column: 0
                    Layout.row: 1
                    Layout.alignment: Layout.Center
                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color : Styles.background
                    text: "Graph"
                }

                Scope
                {
                    id: scope
                    width: 300
                    height: 200
                    Layout.column: 0
                    Layout.row: 2
                    Layout.alignment: Layout.Center
                    symmetrize: true

                    Timer
                    {
                        interval: 64
                        triggeredOnStart: true
                        repeat: true
                        running: true
                        onTriggered: {
                            var array = [];
                            for(var i = 0; i < 10; i++)
                            {
                                array.push(0.8 * (Math.random() * 2 - 1));
                            }
                            scope.points = array;
                        }
                    }
                    Frame{}
                }
                Text {
                    Layout.column: 0
                    Layout.row: 3
                    Layout.alignment: Layout.Center
                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color : Styles.background
                    text: "Scope"
                }
            }
        }

        Page
        {
            background : Rectangle
            {
                anchors.fill : parent
                color : "transparent"
            }
            leftPadding: 50
            header: Text
            {
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 30
                font.family: mainFont
                font.bold : true
                color : Styles.background
                text: "Pads"
                height : 100
                y : 20
            }

            GridLayout
            {
                rowSpacing: 20
                columnSpacing: 100
                anchors.horizontalCenter: parent.horizontalCenter

                XYPad
                {
                    id: xypad

                    Layout.column: 0
                    Layout.row: 0
                    Layout.alignment: Layout.Center

                    width: 200
                    height: 200

                    Frame{}
                }
                Text {
                    Layout.column: 0
                    Layout.row: 1
                    Layout.alignment: Layout.Center
                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    color : Styles.background
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "X-Y Pad\n" + xypad.stickX.toFixed(2) + ", " + xypad.stickY.toFixed(2)
                }

                CosInfluence
                {
                    id: cosinfluence
                    width: 200
                    height: 200
                    Layout.column: 1
                    Layout.row: 0
                    Layout.alignment: Layout.Center

                    Frame{}
                }
                Text {
                    Layout.column: 1
                    Layout.row: 1
                    Layout.alignment: Qt.AlignCenter
                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    color : Styles.background
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "Cosine Influence\n" + prettyArray(cosinfluence.values)

                    function prettyArray(arr)
                    {
                        var str = "";
                        for(var i = 0; i < arr.length; ++i)
                        {
                            str += arr[i].toFixed(2) + ", ";
                        }
                        if(str.length > 0)
                            str = str.substring(0, str.length - 2)
                        return str;
                    }
                }
                Joystick
                {
                    id: joystick
                    width: 200
                    height: 200
                    Layout.column: 0
                    Layout.row: 2
                    Layout.alignment: Layout.Center
                }
                Text {
                    Layout.column: 0
                    Layout.row: 3
                    Layout.alignment: Layout.Center
                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    color : Styles.background
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "Joystick\n" + joystick.stickX.toFixed(2) + ", " + joystick.stickY.toFixed(2)
                }


            }
        }

        Page
        {
            background : Rectangle
            {
                anchors.fill : parent
                color : "transparent"
            }
            header: Text
            {
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 30
                font.family: mainFont
                font.bold : true
                color : Styles.background
                text: "Keys & Matrices & Switch"
                height : 100
                y : 20
            }

            GridLayout
            {
                rowSpacing: 50
                columnSpacing: 100
                anchors.horizontalCenter: parent.horizontalCenter
                Container {
                    Layout.alignment: Layout.Center
                    Layout.column: 0
                    Layout.row: 0

                    width: 300
                    height: 120

                    Keyboard
                    {
                        id: kbd

                        anchors.centerIn: parent
                        height : parent.height - parent.radius*2.
                        width : parent.width - parent.radius*2.

                        firstKey: 36
                        lastKey: 62
                    }
                }
                Text {
                    Layout.column: 0
                    Layout.row: 1
                    Layout.alignment: Layout.Center
                    Layout.maximumWidth: 200
                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color : Styles.background
                    text:
                    {
                        if(kbd.pressedKeys.length > 0)
                            "Keyboard\n" + kbd.pressedKeys[0].key.toFixed(0) + ", " + kbd.pressedKeys[0].vel.toFixed(0)
                        else
                            "Keyboard\n"
                    }
                }
                Container {
                    Layout.column: 1
                    Layout.row: 0
                    Layout.alignment: Layout.Center
                    height: 100
                    width: 100
                    Switch
                    {
                        id : toggleSwitch

                        anchors.centerIn: parent

                        width: 50
                        height: 50
                        onToggle: leds.setIntensityForAll(!onoff);

                    }
                }
                Text {
                    Layout.column: 1
                    Layout.row: 1
                    Layout.alignment: Layout.Center

                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    color : Styles.background
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "Switch\n" + toggleSwitch.state
                }
                Container
                {
                    Layout.column: 0
                    Layout.row: 2
                    Layout.alignment: Layout.Center
                    width: 240
                    height: 240

                Matrix
                {
                    id: matrix
                    anchors.centerIn: parent
                    height : parent.height - parent.radius*4.
                    width : parent.width - parent.radius*4.
                    onPressedChanged:
                    {
                        if(matrix.pressed.length > 0)
                            leds.toggle(matrix.pressed[0]);

                        //else
                        //  leds.setIntensityForAll(0.0);
                    }
                }
                }
                Text {
                    Layout.column: 0
                    Layout.row: 3
                    Layout.alignment: Layout.Center
                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color : Styles.background
                    text:
                    {
                        if(matrix.pressed.length > 0)
                            "Matrix\n" + matrix.pressed[0]
                        else
                            "Matrix\n"
                    }
                }
                Container{
                    Layout.column: 1
                    Layout.row: 2
                    Layout.alignment: Layout.Center
                    width: 240
                    height: 240

                    Leds
                    {
                        id : leds

                        anchors.centerIn: parent
                        height : parent.height - parent.radius*4.
                        width : parent.width - parent.radius*4.
                        easing : true

                        // all leds to off
                        intensity : [
                            [1., 1.,1.],
                            [1.,1.,1.],
                            [1.,1.,1.]
                        ]
                    }
                }
                Text {
                    Layout.column: 1
                    Layout.row: 3
                    Layout.alignment: Layout.Center

                    font.pointSize: 20
                    font.family: mainFont
                    font.bold : true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color : Styles.background
                    text: "Leds\n"
                }


            }
        }
    }
    Row{

        height : 50
        spacing : 5
        Button
        {
            id: btnPrevious

            width: parent.width / 2
            height: parent.height

            onClicked: view.currentIndex = Math.max(view.currentIndex - 1, 0)

            background: Rectangle{
                anchors.fill : parent
                color : btnPrevious.pressed ? Styles.colorOn : Styles.background
            }
            font.bold : true
            contentItem: Text {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: btnPrevious.pressed ? Styles.detail:Styles.colorOff
                font.pointSize: 15
                font.family: mainFont
                text: "Previous"
            }
        }

        Button
        {
            id: btnNext

            width: parent.width / 2
            height: parent.height

            onClicked: view.currentIndex = Math.min(view.currentIndex + 1, view.count - 1)

            background: Rectangle{
                anchors.fill : parent
                color : btnNext.pressed ? Styles.colorOn : Styles.background
            }
            font.bold : true
            contentItem: Text {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: btnNext.pressed ? Styles.detail:Styles.colorOff
                font.pointSize: 15
                font.family: mainFont
                text: "Next"
            }
        }

        anchors.bottom: parent.bottom
        width: parent.width
    }
}
