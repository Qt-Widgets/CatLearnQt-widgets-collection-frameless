﻿#ifndef WINWIDGET_H
#define WINWIDGET_H

#include "RimlessWindowBase.h"
#include <QHash>

class QPushButton;
class ListiongOptions;
class CatDrawingBoard;
class CatAbout;
class CatSettings;
class CatWidget;
class CatQuickWidget;

namespace Ui {
class WinWidget;
}

class WinWidget : public
#if defined(Q_OS_LINUX) || defined(Q_OS_MAC)
    QWidget
#else
    RimlessWindowBase
#endif
{
    Q_OBJECT

public:
    enum CURSORSTATE {
        NONE,
        TOPLEFT,
        TOPRIGHT,
        BOTTOMLEFT,
        BOTTOMRIGHT
    };
    explicit WinWidget(QWidget *parent = nullptr);
    ~WinWidget();

private:
    void InitUi();
    void InitProperty();
    void InitConnect();
    void InitButtonList();

    void SetZoomButtonState(QString state);

    void SetWindowZoom();

    void SetTitle(QString state = "");

    void UpdateStyle();

    void retranslateUi();

protected:
    bool eventFilter(QObject *watched, QEvent *event);
    void mouseDoubleClickEvent(QMouseEvent *event);
    void changeEvent(QEvent *event);

private slots:
    void On_ButtonFunc(int id);

private:
    Ui::WinWidget *ui;
    ListiongOptions *m_pListiongOptions;
    QHash<QString, QPushButton*> m_pButtons;

    CatDrawingBoard *m_pCatDrawingBoard;
    CatAbout *m_pCatAbout;
    CatSettings *m_pCatSettings;
    CatWidget *m_pCatWidget;
    CatQuickWidget *m_pCatQuickWidget;

    bool m_bFullScreen;
    QRect m_pLastRect;

};

#endif // WINWIDGET_H
