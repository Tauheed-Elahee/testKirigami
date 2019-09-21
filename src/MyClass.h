#ifndef MYCLASS_H
#define MYCLASS_H

#include <qt5/QtCore/QString>
#include <qt5/QtCore/QObject>
#include "qt5/QtCore/qlogging.h"

class MyClass : public QObject {
    Q_OBJECT
public slots:
    void cppSlot(const QString &msg);
};

#endif  //MYCLASS_H
