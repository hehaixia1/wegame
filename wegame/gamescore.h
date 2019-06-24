#ifndef GAMESCORE_H
#define GAMESCORE_H

#include <QObject>
#include <QJsonObject>

class GameScore : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int score READ readScore WRITE setScore NOTIFY scoreChanged)
public:
    GameScore();
    int readScore()const;
    void setScore(const int score);

    Q_INVOKABLE bool load();
    Q_INVOKABLE bool save();
    void read(const QJsonObject &json);
    void write(QJsonObject &json);

signals:
    void scoreChanged();
private:
    int m_score;

};



#endif // GAMESCORE_H
