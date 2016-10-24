import QtQuick 2.2
import QtQuick.Controls 1.1
import QtWebView 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.0
import QSystemTrayIcon 1.0


ApplicationWindow {
    property bool showProgress: webView.loading
                                && Qt.platform.os !== "ios"
                                && Qt.platform.os !== "winphone"
                                && Qt.platform.os !== "winrt"
    id: application
    visible: true
    x: initialX
    y: initialY
    width: initialWidth
    height: initialHeight
    title: webView.title

    WebView {
        id: webView
        anchors.fill: parent
        url: initialUrl
    }

    QSystemTrayIcon {
        id: systemTray

        Component.onCompleted: {
            icon = iconTray
            toolTip = "WhatsApp"
            show();
        }

        onActivated: {
            if(reason === 1){
                trayMenu.popup()
            } else {
                if(application.visibility === Window.Hidden) {
                    application.show()
                } else {
                    application.hide()
                }
            }
        }
    }

    // Меню системного трея
    Menu {
        id: trayMenu

        MenuItem {
            text: qsTr("Развернуть окно")
            onTriggered: application.show()
        }

        MenuItem {
            text: qsTr("Выход")
            onTriggered: {
                systemTray.hide()
                Qt.quit()

            }
        }
    }

    // Обработчик события закрытия окна
    onClosing: {
            close.accepted = false
            application.hide()

    }
}
