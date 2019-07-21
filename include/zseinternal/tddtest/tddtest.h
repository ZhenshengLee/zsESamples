#ifndef TDDTEST_HPP
#define TDDTEST_HPP

#include <string>

using namespace std;

class tddTest
{
  public:
    tddTest();
    ~tddTest();
    // 成员函数
    int expr(const char*);
    int exprMul(const char*);
    int exprMulAdd(const char*);
    int exprAddMul(const char*);
    int exprUni(const char*);
    int exprUniBracket(const char*);

  private:
    // 私有成员

    // 私有方法
};

#endif /* TDDTEST */