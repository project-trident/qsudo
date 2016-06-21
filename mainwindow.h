#ifndef MAINWIN_H
#define MAINWIN_H

#include "ui_mainwindow.h"
#include <QProcess>
#include <QSettings>
#include <QDesktopWidget>
#include <QPoint>
#include "../config.h"

class MainWindow : public QMainWindow, private Ui::MainWindow
{
        Q_OBJECT

public:
        MainWindow() : QMainWindow()
        {
          setupUi(this);
	  //Have this always centered on the screen and on top of other windows
	  this->setWindowFlags(Qt::Tool | Qt::WindowStaysOnTopHint );
	  QPoint center = QApplication::desktop()->availableGeometry().center();
	  //Move from center of widget to top-left corner point
	  center.setX( center.x() - (this->width()/2) ); 
	  center.setY( center.y() - (this->height()/2) );
	  this->move(center);
        }

public slots:
    void ProgramInit();

private slots:
    void slotButtonClicked(QAbstractButton *myBut);
    void slotReturnPressed();
    void slotProcDone();
    void slotPrintStdErr();
    void slotPrintStdOut();
    void slotPwdTextChanged ( const QString & text );
    void slotExpandCommandClicked(bool isChecked);


private:
    bool checkSudoCache();
    void startSudo();
    void testPass();
    bool checkUserGroup();
    QProcess *sudoProc;
    QStringList args;
    int tries;
    QSettings *settings;

   QStringList runQuickCmd(QString cmd);

signals:

} ;
#endif // MAINWIN_H

