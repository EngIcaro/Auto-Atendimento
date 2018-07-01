import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
Item {
    height: root.height
    width: root.width
    Rectangle {
        id: recEsquerdo
        height: parent.height *0.009
        width: parent.width *0.3499
        anchors.left: parent.left
        anchors.verticalCenter: imageGaleto.verticalCenter
        color: "#ED3237"
    }
    Rectangle {
        id: recDireito
        height: parent.height *0.009
        width: parent.width *0.3499
        anchors.right: parent.right
        anchors.verticalCenter: imageGaleto.verticalCenter
        color: "#F44336"
    }
    Text {
        id: olaText
        text: qsTr("Olá, seja bem-vindo!")
        anchors.centerIn: parent
        font.family: "Roboto"
        font.pixelSize: 25
    }
    Text {
        id: pedidoText
        anchors.top: olaText.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Aperte o botão para fazer o pedido!")
        font.family: "Roboto"
        font.pixelSize: 25
    }
    Button {
        id: loginButton
        anchors.top: pedidoText.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Fazer Pedido"
        font.family: "Roboto"
        focus: true
        Material.background: "#ED3237"
        Material.foreground: "white"
        font.pixelSize: 20
        height: parent.height*0.1
        onClicked: {
            stackView.push(telaPedido)
        }
    }
    Image {
        id: imageGaleto
        source: "qrc:/galeto.png"
        height: parent.height*0.4
        width: parent.width*0.3
        //fillMode: Image.PreserveAspectFit
        //fillMode: Image.PreserveAspectCrop
        anchors.horizontalCenter: parent.horizontalCenter

    }

}
