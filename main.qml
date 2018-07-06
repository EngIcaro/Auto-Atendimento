import QtQuick 2.8
import QtQuick.Controls 2.1

ApplicationWindow {
    id: root
    visible: true
    width: 1920
    height: 1200
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
    Component{
        id: telaPagamento
        Pagamento{}
    }
}
