import QtQuick 2.8
import QtQuick.Controls 2.1

ApplicationWindow {
    id: root
    visible: true
    width: 840
    height: 480
    title: qsTr("Auto Atendimento")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: telaLogin

    }
    Component{
        id: telaLogin
        Login{}

    }
    Component{
        id: telaPedido
        Pedido{}

    }
}
