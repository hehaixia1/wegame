#include <QApplication>
#include <FelgoApplication>
#include <QQmlContext>
#include "score.h"
#include "gamescore.h"
#include <QQmlApplicationEngine>


int main(int argc, char *argv[])
{

    QApplication app(argc, argv);

    FelgoApplication felgo;

    //模块名，版本号,组建名
    qmlRegisterType<GameScore>("GameScoreType",1,0,"GameScore");

    QQmlApplicationEngine engine;
    felgo.initialize(&engine);
    Score score;
    engine.rootContext()->setContextProperty("grade", &score);
    qmlRegisterType<Score>("student",1,0,"Score");

    felgo.setLicenseKey(PRODUCT_LICENSE_KEY);
    felgo.setMainQmlFileName(QStringLiteral("qml/Main.qml"));



    engine.load(QUrl(felgo.mainQmlFileName()));

    return app.exec();
}

