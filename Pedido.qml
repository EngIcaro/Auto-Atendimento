import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1

Item {
    height: root.height
    width: root.width
    property var pedidofinal: ""
    property var auxvalor: ""
    ListModel{
        id: contactModel
        ListElement { produto: "Executivo de Galeto"; valor: "13.00"; tipo: 1; }
        ListElement { produto: "Executivo de Boi   ";    valor: "14.00"; tipo: 1}
        ListElement { produto: "Executivo de Porco   ";    valor: "14.00"; tipo: 1}
        ListElement { produto: "Executivo de Calabresa   ";    valor: "14.00"; tipo: 1}
        ListElement { produto: "Coxa e SobreCoxa   ";    valor: "6.00"; tipo: 2}
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
                    auxvalor = valor
                    console.log(pedidofinal)
                    if(tipo === 1){
                        if(produto == "Executivo de Galeto"){
                            textProteinaPedido1.text = "Escolha a Parte do Galeto"
                            buttonCoxa.text = "Coxa e Sobre-Coxa"
                            buttonPeito.text = "Peito e Asa"

                        }
                        else{

                            textProteinaPedido1.text = "Como deseja a Carne?"
                            buttonCoxa.text = "Bem Passada"
                            buttonPeito.text = "Ao Ponto"
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
            onClosed: {
                pedidofinal = ""
                auxvalor = ""
                flickableScroll.position = 0.0
            }

            Flickable {
                id: flickable
                anchors.fill: parent
                contentWidth: popUpPedido1.width
                contentHeight: popUpPedido1.height*1.15
                flickableDirection: Flickable.VerticalFlick

                //ScrollIndicator.vertical: ScrollIndicator { }
                ScrollBar.vertical: ScrollBar {
                    id: flickableScroll
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
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.3
                    // anchors.horizontalCenter: columnRetirarPedido1.horizontalCenter
                    height: popUpPedido1.height*0.1
                    width: popUpPedido1.width * 0.4
                    text: "Finalizar"
                    font.family: "Roboto"
                    focus: true
                    Material.background: "#4CAF50"
                    Material.foreground: "white"
                    font.pixelSize: 20
                    onClicked: {
                        var aux = 0
                        if(buttonFeijaoTropeiro.checked){
                            aux++
                            if(aux == 4){
                                pedidofinal = pedidofinal + "F.Tropeiro" + "\n"
                                aux = 0
                            }
                            else{
                                pedidofinal = pedidofinal + "F.Tropeiro" + "\\ "
                            }


                        }
                        if(buttonFeijaoCaseiro.checked){
                            aux++
                            if(aux==4){
                                pedidofinal = pedidofinal + "F.Caseiro" + "\n"
                                aux = 0
                            }
                            else{
                                pedidofinal = pedidofinal + "F.Caseiro" + "\\ "

                            }


                        }
                        if(buttonSemFeijao.checked){
                            aux++
                            if(aux==4){
                                pedidofinal = pedidofinal + "Sem Feijao" + "\n"
                                aux = 0
                            }
                            else{
                                pedidofinal = pedidofinal + "Sem Feijao" + "\\ "

                            }

                        }
                        if(buttonMaionese.checked){
                            aux++
                            if(aux==4){
                                pedidofinal = pedidofinal + buttonMaionese.text + "\n"
                                aux = 0
                            }
                            else{
                                pedidofinal = pedidofinal + buttonMaionese.text + "\\ "
                            }

                        }
                        if(buttonPure.checked){
                            aux++
                            if(aux==4){
                                pedidofinal = pedidofinal + buttonPure.text + "\n"
                                aux = 0
                            }
                            else{
                                pedidofinal = pedidofinal + buttonPure.text + "\\ "

                            }

                        }
                        if(buttonMaionesePure.checked){
                            aux++
                            if(aux==4){
                                pedidofinal = pedidofinal + "SemMaioPure" + "\n"
                                aux=0
                            }
                            else{
                                pedidofinal = pedidofinal + "SemMaioPure" + "\\ "

                            }

                        }
                        if(buttonCoxa.checked){
                            aux++
                            if(aux==4){
                                pedidofinal = pedidofinal + "Coxa" + "\n"
                                aux=0
                            }
                            else{
                                pedidofinal = pedidofinal + "Coxa" + "\\ "

                            }

                        }
                        if(buttonPeito.checked){
                            aux++
                            if(aux==4){

                                pedidofinal = pedidofinal + "Peito" + "\n"
                                aux=0
                            }
                            else{
                                pedidofinal = pedidofinal + "Peito" + "\\ "

                            }

                        }
                        if(buttonSemArroz.checked){
                            aux++
                            if(aux==4){

                                pedidofinal = pedidofinal + "SemArroz" + "\n"
                                aux=0
                            }
                            else{
                                pedidofinal = pedidofinal + "SemArroz" + "\\ "

                            }

                        }
                        if(buttonSemFeijao.checked){
                            aux++
                            if(aux==4){
                                pedidofinal = pedidofinal + "SemFeijao" + "\n"
                                aux=0
                            }
                            else{
                                pedidofinal = pedidofinal + "SemFeijao" + "\\ "

                            }

                        }
                        if(buttonSemFritas.checked){
                            aux++
                            if(aux==4){
                                pedidofinal = pedidofinal + "SemFritas" + "\n"
                                aux=0
                            }
                            else{
                                pedidofinal = pedidofinal + "SemFritas" + "\\ "

                            }

                        }
                        if(buttonSemMacarrao.checked){
                            aux++
                            if(aux==4){
                                aux=0
                                pedidofinal = pedidofinal + "SemMacarrao" + "\n"
                            }
                            else{
                                pedidofinal = pedidofinal + "SemMacarrao" + "\\ "

                            }

                        }
                        if(buttonMaisArroz.checked){
                            aux++
                            if(aux==4){
                                aux=0
                                pedidofinal = pedidofinal + "+Arroz" + "\n"
                            }
                            else{
                                pedidofinal = pedidofinal + "+Arroz" + "\\ "

                            }

                        }
                        if(buttonMaisFeijao.checked){
                            aux++
                            if(aux==4){
                                pedidofinal = pedidofinal + "+Feijao" + "\n"
                                aux=0
                            }
                            else{
                                pedidofinal = pedidofinal + "+Feijao" + "\\ "

                            }

                        }
                        if(buttonMaisFritas.checked){
                            aux++
                            if(aux==4){
                                aux=0
                                pedidofinal = pedidofinal + "+Fritas" + "\n"
                            }
                            else{
                                pedidofinal = pedidofinal + "+Fritas" + "\\ "

                            }

                        }
                        if(buttonMaisMacarrao.checked){
                            aux++
                            if(aux==4){
                                aux =0
                                pedidofinal = pedidofinal + "+Macarrao" + "\n"
                            }
                            else{
                                pedidofinal = pedidofinal + "+Macarrao" + "\\ "
                            }

                        }
                        if(buttonMaisMaionese.checked){
                            aux++
                            if(aux==4){
                                aux=0
                                pedidofinal = pedidofinal + "+MaioOuPure" + "\n"
                            }
                            else{
                                pedidofinal = pedidofinal + "+MaioOuPure" + "\\ "

                            }

                        }
                        listResultado.model.append({textResultado: pedidofinal, valorResultado: auxvalor})
                        //console.log(auxIndex)
                        buttonFeijaoTropeiro.checked = true
                        buttonMaisMaionese.checked = false
                        buttonMaisMacarrao.checked = false
                        buttonMaisFritas.checked = false
                        buttonMaisFeijao.checked = false
                        buttonMaisArroz.checked = false
                        buttonSemMacarrao.checked = false
                        buttonSemFritas.checked = false
                        buttonSemFeijao.checked = false
                        buttonSemArroz.checked = false
                        buttonFeijaoCaseiro.checked = false
                        buttonPeito.checked = false
                        buttonCoxa.checked = false
                        buttonMaionesePure.checked = false
                        buttonPure.checked = false
                        buttonMaionese.checked = true
                        buttonSemFeijao.checked = false
                        popUpPedido1.close()
                        pedidofinal = ""

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
            clip: true
            //anchors.left: panePedido.right
            //anchors.leftMargin: 3
            //anchors.top: panePedido.top
            Material.elevation: 13

            ListView{
                id: listResultado
                anchors.fill: parent
                //anchors.top: paneResultado.top
                //  width: paneResultado.width
                //anchors.bottom: finalizarButton.top
                model: ListModel{}
                spacing: 2
                delegate: Rectangle{
                  //  property int indexx: 0
                    id: recListResultado
                    width: listResultado.width; height: listResultado.height/6
                    border.color: "grey"
                    radius: 5
                    clip: true
                    Text {
                        id: textListResultado
                        text: textResultado
                        width: recListResultado.width*0.7
                        font.family: "Roboto"
                        font.pixelSize: 20
                        anchors.left: recListResultado.left
                        anchors.leftMargin: 10
                        anchors.verticalCenter: recListResultado.verticalCenter
                    }
                    Row{
                        id: columnListResultado
                        anchors.left: textListResultado.right
                        anchors.verticalCenter: recListResultado.verticalCenter
                        spacing: 3
                        Text {
                            id: textValorListResultado
                            text: '<b>R$: ' + valorResultado + '</b>';
                            font.family: "Roboto"
                            font.pixelSize: 20
                            anchors.verticalCenter: buttonExcluirResultado.verticalCenter
                        }
                        Button{
                            id: buttonExcluirResultado
                            anchors.verticalCenter: columnListResultado.verticalCenter
                            width: columnListResultado.width*0.45
                            height: 60
                            background: Rectangle{
                                //border.color: "black"
                                Image {
                                    id: imageExcluirResultado
                                    source: "qrc:/lixeira.png"
                                    height: 35
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    //anchors.left: parent.left
                                    //anchors.leftMargin: columnListResultado.width*0.1
                                    //anchors.top: parent.top
                                    //anchors.topMargin: columnListResultado.height*0.05
                                }
                            }
                            onClicked: {
                                var stop = 1
                                var indexx = 0
                                while(stop == 1){
                                    if(listResultado.model.get(indexx).textResultado == textResultado){
                                        stop = 0
                                    }
                                    else{
                                        indexx++
                                    }
                                }

                                listResultado.model.remove(indexx)
                            }
                        }
                    }
                }
            }

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
