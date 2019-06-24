#include "gamescore.h"
#include <QFile>
#include <QJsonDocument>

GameScore::GameScore()
{

}
int GameScore::readScore() const
{
    return m_score;
}

void GameScore::setScore(const int score)
{
    m_score = score;
}

void GameScore::read(const QJsonObject &json)
{
    if(json.contains("score") && json["score"].isDouble())
        m_score = json["score"].toInt();
}

void GameScore::write(QJsonObject &json)
{
    json["score"] = m_score;
}

bool GameScore::load()
{
    //导入json文件
    QFile loadFile( QStringLiteral("gamedata.json"));
    //判断
    if(!loadFile.open(QIODevice::ReadOnly)){
        qWarning("Couldn't open file");
        return false;
    }
    QByteArray gamedata = loadFile.readAll();
    // 将导入的数据以json文档的形式组织
    QJsonDocument loadDoc(QJsonDocument::fromJson(gamedata));
    //通过文档得到json对象
    QJsonObject json(loadDoc.object());

    read(json);

    return true;
}

bool GameScore::save()
{
    QFile saveFile(QStringLiteral("gamedata.json"));

    if(!saveFile.open(QIODevice::WriteOnly)){
        qWarning("Couldn't open file");
        return false;
    }

    QJsonObject data;

    write(data);
    //将这个data对象变为文档
    QJsonDocument saveDoc(data);

    saveFile.write(saveDoc.toJson());

    return true;

}
