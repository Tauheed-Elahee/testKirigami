/*
 * <one line to give the program's name and a brief idea of what it does.>
 * Copyright 2020  <copyright holder> <email>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License or (at your option) version 3 or any later version
 * accepted by the membership of KDE e.V. (or its successor approved
 * by the membership of KDE e.V.), which shall act as a proxy
 * defined in Section 14 of version 3 of the license.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef TODOMODEL_H
#define TODOMODEL_H

#include <QAbstractListModel>

/**
 * @todo write docs
 */

class ToDoList;

class ToDoModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(ToDoList *list READ list WRITE setList)

public:
    explicit ToDoModel(QObject *parent = nullptr);
    
    enum Roles {
        DoneRole = Qt::UserRole,
        DescriptionRole
    };
    
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;
    
    Qt::ItemFlags flags(const QModelIndex & index) const override;
    
    virtual QHash<int, QByteArray> roleNames() const override;
    
    ToDoList *list() const;
    void setList(ToDoList *list);

private:
    ToDoList *mList;
};

#endif // TODOMODEL_H
