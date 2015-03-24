#ifndef CONTAINER_H
#define CONTAINER_H

#include <QAbstractListModel>
#include <QObject>
#include <QDebug>

class ContainerObject : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString path READ path WRITE setPath NOTIFY pathChanged)
    Q_PROPERTY(bool encrypted READ isEncrypted WRITE setEncrypted NOTIFY encryptedChanged)
public:
    ContainerObject(QObject* parent = 0);
    ContainerObject(const QString& name,
                    const QString& path = QString(),
                    bool encrypted = false,
                    QObject* parent = 0);
    ~ContainerObject();

    QString name() const;
    void setName(const QString& name);
    QString path() const;
    void setPath(const QString& path);
    bool isEncrypted() const;
    void setEncrypted(bool encrypted);
signals:
    void nameChanged();
    void pathChanged();
    void encryptedChanged();
private:
    QString name_;
    QString path_;
    bool encrypted_;
};

class ContainerModel : public QAbstractListModel
{
    Q_OBJECT
    Q_DISABLE_COPY(ContainerModel)
    Q_PROPERTY(int count READ rowCount NOTIFY countChanged)

public:
    enum ContainerRoles {
        ObjectRole = Qt::UserRole + 1
    };

    ContainerModel(QObject* parent = 0);
    ~ContainerModel();

    // Reimplemented methods
    int rowCount(const QModelIndex& parent = QModelIndex()) const;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const;

    // Additional QML API
    Q_INVOKABLE ContainerObject* get(int idx/*const QModelIndex& index*/) const;
    Q_INVOKABLE void add(ContainerObject* container);
    Q_INVOKABLE void add(const QString& name /*TODO*/);
    Q_INVOKABLE void remove(int idx);

public slots:

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<ContainerObject*> containerList_;

signals :
    void countChanged(/*int*/);
};

#endif // CONTAINER_H
