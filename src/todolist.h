/*
 * <one line to give the program's name and a brief idea of what it does.>
 * Copyright (C) 2020  <copyright holder> <email>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef TODOLIST_H
#define TODOLIST_H

#include <QObject>
#include <QVector>

/**
 * @todo write docs
 */

struct ToDoItem
{
    bool done;
    QString description;
};

class ToDoList : public QObject
{
    Q_OBJECT

public:
    explicit ToDoList(QObject *parent = nullptr);
    
    QVector<ToDoItem> items() const;
    
    bool setItemAt(int index, const ToDoItem &item);
    
signals:
    void preItemAppended();
    void postItemAppended();
    
    void preItemRemoved(int index);
    void postItemRemoved();
    
public slots:
    void appendItem();
    void removeCompletedItems();
    
private:
    QVector<ToDoItem> mItems;
};

#endif // TODOLIST_H
