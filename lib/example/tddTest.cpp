#include "public/common.h"

#include "example/tddTest.h"

using namespace std;

tddTest::tddTest()
{
}

tddTest::~tddTest()
{
}

struct Context
{
    const char* pBuf;
    int iPos;
};

int getNumBracket(Context& ctx)
{
    // ...
}

int getNum(Context& ctx)
{
    // ascii of '0' is 0x30
    return ctx.pBuf[ctx.iPos++] - '0';
}

const char getOp(Context& ctx)
{
    return *(ctx.pBuf + ctx.iPos++);
}

int simpleCalc(char cOp, Context& ctx, int& num)
{
    if ('+' == cOp)
    {
        return num += getNum(ctx);
    }
    else if ('-' == cOp)
    {
        return num -= getNum(ctx);
    }
    return 0;
}

int calc(int iRet, char cOp, int iNum)
{
    // printf("iRet: %d",iRet);
    switch (cOp)
    {
        case '+':
            iRet += iNum;
            break;
        case '-':
            iRet -= iNum;
            break;
        case '*':
            iRet *= iNum;
            break;
        case '/':
            iRet /= iNum;
            break;
        default:
            break;
    }
    return iRet;
}

bool isMul(Context& ctx)
{
    // 只是判定，不改变上下文环境
    return '*' == *(ctx.pBuf + ctx.iPos) || '/' == *(ctx.pBuf + ctx.iPos);
}

bool isAdd(Context& ctx)
{
    // 只是判定，不改变上下文环境
    return '+' == *(ctx.pBuf + ctx.iPos) || '-' == *(ctx.pBuf + ctx.iPos);
}

// 范式：取出左值，取出符号，取出右值
int operation(Context& ctx, int (*fnNum)(Context&), bool (*fnOp)(Context&))
{
    int iRet = fnNum(ctx);
    while (fnOp(ctx))
    {
        char cOp = getOp(ctx);
        int iRight = fnNum(ctx);
        iRet = calc(iRet, cOp, iRight);
    }
    return iRet;
}

int mul(Context& ctx)
{
    return operation(ctx, getNum, isMul);
    int iRet = getNum(ctx);
    while (isMul(ctx))
    {
        char cOp = getOp(ctx);
        int iNum = getNum(ctx);
        iRet = calc(iRet, cOp, iNum);
    }
    return iRet;
}

int add(Context& ctx, int iAdd)
{
    // 乘加代替加，因为任何数可以看做1*他本身
    return operation(ctx, mul, isAdd);
    return operation(ctx, getNum, isAdd);
    int iRet = iAdd;
    while (isAdd(ctx))
    {
        char cOp = getOp(ctx);
        int iNum = getNum(ctx);
        iRet = calc(iRet, cOp, iNum);
    }
    return iRet;
}

int mulAdd(Context& ctx)
{
    return operation(ctx, mul, isAdd);
    int iRet = 0;
    // iPos为一个全局游标
    iRet = mul(ctx);
    while (isAdd(ctx))
    {
        char cOp = getOp(ctx);
        int iNum = mul(ctx);
        iRet = calc(iRet, cOp, iNum);
    }
    return iRet;
}

int addMul(Context& ctx)
{
    return mulAdd(ctx);
    int iRet = 0;
    // iPos为一个全局游标
    iRet = getNum(ctx);
    while (isAdd(ctx))
    {
        char cOp = getOp(ctx);
        int iNum = mul(ctx);
        iRet = calc(iRet, cOp, iNum);
    }

    return iRet;
}

int tddTest::exprUniBracket(const char* pStr)
{
    Context ctx;
    ctx.pBuf = pStr;
    ctx.iPos = 0;
    int iRet = mulAdd(ctx);

    return iRet;
}

int tddTest::exprUni(const char* pStr)
{
    Context ctx;
    ctx.pBuf = pStr;
    ctx.iPos = 0;
    int iRet = mulAdd(ctx);

    return iRet;
}

int tddTest::exprMul(const char* pStr)
{
    Context ctx;
    ctx.pBuf = pStr;
    ctx.iPos = 0;

    return mul(ctx);
}

int tddTest::exprMulAdd(const char* pStr)
{
    Context ctx;
    ctx.pBuf = pStr;
    ctx.iPos = 0;

    return mulAdd(ctx);
}

int tddTest::exprAddMul(const char* pStr)
{
    Context ctx;
    ctx.pBuf = pStr;
    ctx.iPos = 0;

    return addMul(ctx);
}

int tddTest::expr(const char* pStr)
{
    Context ctx;
    ctx.pBuf = pStr;
    ctx.iPos = 0;
    int iRet = getNum(ctx);
    // iPos为一个全局游标
    while (0 != ctx.pBuf[ctx.iPos])
    {
        char cOp = getOp(ctx);
        int iNum = getNum(ctx);
        iRet = calc(iRet, cOp, iNum);
        // simpleCalc(cOp, ctx, iRet);
        // if('+' == cOp)
        // {
        //     iRet += getNum(ctx);
        // }
        // else if('-' == cOp)
        // {
        //     iRet -= getNum(ctx);
        // }
    }

    return iRet;
}
