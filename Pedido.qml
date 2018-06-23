import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1

Item {
    height: root.height
    width: root.width
    property var pedidofinal: ""
    ListModel{
        id: contactModel
        ListElement { produto: "Executivo de Galeto"; valor: 13.00; tipo: 1; }
        ListElement { produto: "Executivo de Boi   ";    valor: 14.00; tipo: 1}
        ListElement { produto: "Executivo de Porco   ";    valor: 14.00; tipo: 1}
        ListElement { produto: "Executivo de Calabresa   ";    valor: 14.00; tipo: 1}
        ListElement { produto: "Coxa e SobreCoxa   ";    valor: 6.00; tipo: 2}
    }

    Component {
        id: contactDelegate
        Rectangle {
            id: recDelegate
            width: listPedido.width; height: listPedido.height/10
            border.color: "grey"
            radius: 5
            Text { text: produto;
                font.family: "Roboto"
                font.pixelSize: 20
                anchors.left: recDelegate.left
                anchors.leftMargin: 10
                anchors.verticalCenter: recDelegate.verticalCenter
            }
            Text { text: '<b>R$: ' + valor + '</b>';
                font.family: "Roboto"
                font.pixelSize: 20
                anchors.right: recDelegate.right
                anchors.rightMargin: 10
                anchors.verticalCenter: recDelegate.verticalCenter
            }
            MouseArea{
                id: mouseDelegate
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    pedidofinal = pedidofinal + produto + "\n"
                    console.log(pedidofinal)
                    if(tipo === 1){
                        if(produto == "Executivo de Galeto"){
                            columnProteinaPedido1.visible = true
                        }
                        else{
                            columnProteinaPedido1.visible = false
                        }

                        popUpPedido1.open()
                    }
                    else if(tipo == 2){
                        popUpPedido2.open()
                    }

                }
            }
        }
    }

    Rectangle{
        id: recPopUp
        height: parent.height*0.9
        width: parent.width*0.5
        anchors.centerIn: parent

        Popup{
            id: popUpPedido1
            height: parent.height
            width: parent.width
            modal: true
            focus: true
            clip: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

            Flickable {
                id: flickable
                anchors.fill: parent
                contentWidth: popUpPedido1.width
                contentHeight: popUpPedido1.height*1.6
                flickableDirection: Flickable.VerticalFlick
                //ScrollIndicator.vertical: ScrollIndicator { }
                ScrollBar.vertical: ScrollBar {
                    parent: flickable
                     anchors.top: flickable.top
                    //anchors.left: flickable.right
                    //anchors.bottom: flickable.bottom
                    orientation: Qt.Vertical }       // uncomment to test

                Column{
                    id: columnFeijaoPedido1
                    anchors.top: popUpPedido1.top
                    anchors.left: popUpPedido1.Left
                    anchors.right: popUpPedido1.Right
                    Text {
                        id: textFeijaoPedido1
                        text: qsTr("Escolha o Feijão")
                        font.family: "Roboto"
                        font.pixelSize: 20
                    }
                    RadioButton{
                        id: buttonFeijaoTropeiro
                        text: "Feijão Tropeiro"
                        font.family: "Roboto"
                        checked: true
                        height: 35
                    }
                    RadioButton{
                        id: buttonFeijaoCaseiro
                        text: "Feijão Caseiro"
                        font.family: "Roboto"
                        height: 35
                    }
                    RadioButton{
                        id: buttonSemFeijao
                        text: "Sem Feijão"
                        font.family: "Roboto"
                        height: 35
                    }
                }
                Column{
                    id: columnMaionesePedido1
                    anchors.top: columnFeijaoPedido1.bottom
                    anchors.left: popUpPedido1.Left
                    anchors.right: popUpPedido1.Right
                    Text {
                        id: textMaionesePedido1
                        text: qsTr("Escolha entre Maionese ou Purê")
                        font.family: "Roboto"
                        font.pixelSize: 20
                    }
                    RadioButton{
                        id: buttonMaionese
                        height: 35
                        text: "Maionese"
                        font.family: "Roboto"
                        checked: true
                    }
                    RadioButton{
                        id: buttonPure
                        text: "Purê"
                        font.family: "Roboto"
                        height: 35
                    }
                    RadioButton{
                        id: buttonMaionesePure
                        text: "Sem Maionese e Sem Purê"
                        font.family: "Roboto"
                        height: 35
                    }
                }
                Column{
                    id: columnProteinaPedido1
                    anchors.top: columnMaionesePedido1.bottom
                    anchors.left: popUpPedido1.Left
                    anchors.right: popUpPedido1.Right
                    visible: false
                    Text {
                        id: textProteinaPedido1
                        text: qsTr("Escolha a Parte do Galeto")
                        font.family: "Roboto"
                        font.pixelSize: 20
                    }
                    RadioButton{
                        id: buttonCoxa
                        height: 35
                        font.family: "Roboto"
                        text: "Coxa e Sobre-Coxa"

                    }
                    RadioButton{
                        id: buttonPeito
                        text: "Peito e Asa"
                        font.family: "Roboto"
                        height: 35
                    }
                }
                Column{
                    id: columnRetirarPedido1
                    anchors.top: columnProteinaPedido1.bottom
                    anchors.left: popUpPedido1.Left
                    anchors.right: popUpPedido1.Right
                    Text {
                        id: textRetirarPedido1
                        text: qsTr("Deseja modificar o Acompanhamento?")
                        font.family: "Roboto"
                        font.pixelSize: 20
                    }
                    CheckBox{
                        id: buttonSemArroz
                        height: 35
                        font.family: "Roboto"
                        text: "Sem Arroz"

                    }
                    CheckBox{
                        id: buttonSemMacarrao
                        text: "Sem Macarrão"
                        font.family: "Roboto"
                        height: 35
                    }
                    CheckBox{
                        id: buttonSemFritas
                        text: "Sem Fritas"
                        font.family: "Roboto"
                        height: 35
                    }
                    CheckBox{
                        id: buttonMaisArroz
                        text: "Mais Arroz"
                        font.family: "Roboto"
                        height: 35
                    }
                    CheckBox{
                        id: buttonMaisMacarrao
                        text: "Mais Macarrao"
                        font.family: "Roboto"
                        height: 35
                    }
                    CheckBox{
                        id: buttonMaisFritas
                        text: "Mais Fritas"
                        font.family: "Roboto"
                        height: 35
                    }
                    CheckBox{
                        id: buttonMaisFeijao
                        text: "Mais Feijão"
                        font.family: "Roboto"
                        height: 35
                    }
                    CheckBox{
                        id: buttonMaisMaionese
                        text: "Mais Maionese ou Purê"
                        font.family: "Roboto"
                        height: 35
                    }
                }
                Button{
                    id: buttonFinalizarPedido1
                    anchors.top: columnRetirarPedido1.bottom
                    anchors.horizontalCenter: columnRetirarPedido1.horizontalCenter
                    height: popUpPedido1.height*0.1
                    width: popUpPedido1.width * 0.4
                    text: "Finalizar"
                    font.family: "Roboto"
                    focus: true
                    Material.background: "#4CAF50"
                    Material.foreground: "white"
                    font.pixelSize: 20
                    onClicked: {
                       //if()
                    }
                }
            }
        }
        Popup{
            id: popUpPedido2
            height: parent.height
            width: parent.width
            modal: true
            focus: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        }
    }

    Rectangle{
        id: recPedido
        height: parent.height
        width: parent.width
        color: Material.accent


        Text {
            id: panePedidoText
            anchors.bottom: panePedido.top
            anchors.bottomMargin: 5
            anchors.left: panePedido.left
            text: qsTr("Escolha um produto de cada vez.")
            color: "white"
            font.family: "Roboto"
            font.pixelSize: 25
        }

        Pane{
            id: panePedido
            height: parent.height*0.87
            width: parent.width*0.46
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            Material.elevation: 13
            clip: true
            ListView{
                id: listPedido
                spacing: 2
                anchors.fill: parent
                model: contactModel
                delegate: contactDelegate
            }

        }

        Text {
            id: paneResultadoText
            anchors.bottom: paneResultado.top
            anchors.bottomMargin: 5
            anchors.left: paneResultado.left
            text: qsTr("Seu Pedido.")
            font.family: "Roboto"
            color: "white"
            font.pixelSize: 25
        }

        Pane{
            id: paneResultado
            height: parent.height*0.87
            width: parent.width*0.46
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            //anchors.left: panePedido.right
            //anchors.leftMargin: 3
            //anchors.top: panePedido.top
            Material.elevation: 13
            Button {
                id: finalizarButton
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                height: parent.height *0.15
                width: parent.width * 0.48
                text: "Finalizar"
                font.family: "Roboto"
                focus: true
                Material.background: "#4CAF50"
                Material.foreground: "white"
                font.pixelSize: 20
            }
            Button {
                id: cancelarButton
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                height: parent.height *0.15
                width: parent.width * 0.48
                text: "Cancelar"
                font.family: "Roboto"
                focus: true
                Material.background: "#ED3237"
                Material.foreground: "white"
                font.pixelSize: 20
            }
        }

    }
}
