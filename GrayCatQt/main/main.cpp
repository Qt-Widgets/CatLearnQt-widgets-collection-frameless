﻿//#include <QApplication>
#include <SingleApplication>
#include <CatLog>

int main(int argc, char *argv[])
{
    // [0] 进程单例 - 不可重复打开
    SingleApplication a(argc, argv);
    CATLOG::CatLog::Instance();
    std::thread th([](){
        std::thread::id tid = std::this_thread::get_id();
        std::cout << "main id=" << tid << std::endl;
        std::cout.flush();
    });
    th.join();


    std::thread ths([](){
        std::thread::id tid = std::this_thread::get_id();
        std::cout << "main id=" << tid << std::endl;
        std::cout.flush();
    });
    ths.join();
    CATLOG::CatLog::__Write_Log(DEBUG_LOG("test"));


    return a.exec();
}
