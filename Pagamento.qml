import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1

Item {
    height: root.height
    width: root.width
    Rectangle{
        id: recPedido
        height: parent.height
        width: parent.width
        color: Material.accent
        Pane{
            id: panePagamento
            anchors.centerIn: parent
            width: parent.width*0.4
            height: parent.height*0.7
            clip: true
            Material.elevation: 13
            Column{
                id: columnPagamento
                anchors.centerIn: parent
                spacing: parent.height*0.05
                Text {
                    id: textPagamento
                    text: qsTr("Escolha a forma de pagamento")
                    font.family: "Roboto"
                    font.pixelSize: 20
                }
                RadioButton{
                    id: radioCartao
                    height: 35
                    indicator.height: 30
                    indicator.width: 30
                    font.family: "Roboto"
                    anchors.left: columnPagamento.left
                    anchors.leftMargin: panePagamento.width*0.13
                    checked: true
                    text: "Cartão"
                }
                RadioButton{
                    id: radioDinheiro
                    text: "Dinheiro"
                    indicator.height: 30
                    indicator.width: 30
                    anchors.left: columnPagamento.left
                    anchors.leftMargin: panePagamento.width*0.13
                    font.family: "Roboto"
                    height: 35
                }
            }
        }
    }
}
