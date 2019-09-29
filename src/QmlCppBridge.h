#ifndef QMLCPPBRIDGE_H
#define QMLCPPBRIDGE_H

#include <qt5/QtCore/QString>
#include <qt5/QtCore/QObject>
#include "qt5/QtCore/qlogging.h"

class QmlCppBridge : public QObject {
    Q_OBJECT
public:
    QmlCppBridge(QObject* parent = nullptr);
    Q_INVOKABLE static void printHello();
public slots:
    void cppSlot(const QString &msg);
};

#endif  //QMLCPPBRIDGE_H
