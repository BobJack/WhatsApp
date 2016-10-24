TEMPLATE = app
TARGET = WhatsApp

QT += qml quick webview widgets quickwidgets

SOURCES += main.cpp

RESOURCES += qml.qrc

EXAMPLE_FILES += doc

ios:QMAKE_INFO_PLIST =

target.path = $$[QT_INSTALL_EXAMPLES]/webview/WhatsApp
INSTALLS += target
