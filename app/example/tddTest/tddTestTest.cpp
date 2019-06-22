#include <gtest/gtest.h>

#include "example/tddTest.h"

TEST(tddTest, singleNumber)
{
    tddTest zsTddTest;
    ASSERT_EQ(1, zsTddTest.expr("1"));
    ASSERT_EQ(2, zsTddTest.expr("2"));
}

TEST(tddTest, add)
{
    tddTest zsTddTest;
    ASSERT_EQ(3, zsTddTest.expr("1+2"));
    ASSERT_EQ(6, zsTddTest.expr("1+2+3"));
    ASSERT_EQ(1, zsTddTest.expr("2-1"));
    ASSERT_EQ(0, zsTddTest.expr("3-2-1"));
    ASSERT_EQ(4, zsTddTest.expr("2-1+3"));
}

TEST(tddTest, mul)
{
    tddTest zsTddTest;
    ASSERT_EQ(2, zsTddTest.exprMul("1*2"));
    ASSERT_EQ(6, zsTddTest.exprMul("1*2*3"));
}

TEST(tddTest, mulAdd)
{
    tddTest zsTddTest;
    ASSERT_EQ(7, zsTddTest.exprMulAdd("2*3+1"));
    ASSERT_EQ(8, zsTddTest.exprMulAdd("2*3+1*2"));
}

TEST(tddTest, addMul)
{
    tddTest zsTddTest;
    ASSERT_EQ(7, zsTddTest.exprAddMul("1+2*3"));
    ASSERT_EQ(11, zsTddTest.exprAddMul("1+2*3+4"));
    ASSERT_EQ(16, zsTddTest.exprAddMul("1+2*3+4+5"));
    ASSERT_EQ(27, zsTddTest.exprAddMul("1+2*3+4*5"));
}

TEST(tddTest, addMulIsMulAdd)
{
    tddTest zsTddTest;
    ASSERT_EQ(7, zsTddTest.exprMulAdd("2*3+1"));
    ASSERT_EQ(8, zsTddTest.exprMulAdd("2*3+1*2"));
    ASSERT_EQ(7, zsTddTest.exprMulAdd("1+2*3"));
    ASSERT_EQ(11, zsTddTest.exprMulAdd("1+2*3+4"));
    ASSERT_EQ(16, zsTddTest.exprMulAdd("1+2*3+4+5"));
    ASSERT_EQ(27, zsTddTest.exprMulAdd("1+2*3+4*5"));
    // 神奇啊，exprAddMul这个函数要被废弃
    ASSERT_EQ(7, zsTddTest.exprAddMul("2*3+1"));
    ASSERT_EQ(8, zsTddTest.exprAddMul("2*3+1*2"));
    ASSERT_EQ(7, zsTddTest.exprAddMul("1+2*3"));
    ASSERT_EQ(11, zsTddTest.exprAddMul("1+2*3+4"));
    ASSERT_EQ(16, zsTddTest.exprAddMul("1+2*3+4+5"));
    ASSERT_EQ(27, zsTddTest.exprAddMul("1+2*3+4*5"));
}

TEST(tddTest, addIsMulAdd)
{
    tddTest zsTddTest;
    ASSERT_EQ(3, zsTddTest.exprMulAdd("1+2"));
    ASSERT_EQ(6, zsTddTest.exprMulAdd("1+2+3"));
    ASSERT_EQ(1, zsTddTest.exprMulAdd("2-1"));
    ASSERT_EQ(0, zsTddTest.exprMulAdd("3-2-1"));
    ASSERT_EQ(4, zsTddTest.exprMulAdd("2-1+3"));
}

TEST(tddTest, universe)
{
    // 全部用mulAdd来实现
    tddTest zsTddTest;
    ASSERT_EQ(3, zsTddTest.exprUni("1+2"));
    ASSERT_EQ(6, zsTddTest.exprUni("1+2+3"));
    ASSERT_EQ(1, zsTddTest.exprUni("2-1"));
    ASSERT_EQ(0, zsTddTest.exprUni("3-2-1"));
    ASSERT_EQ(4, zsTddTest.exprUni("2-1+3"));
    ASSERT_EQ(7, zsTddTest.exprUni("2*3+1"));
    ASSERT_EQ(8, zsTddTest.exprUni("2*3+1*2"));
    ASSERT_EQ(7, zsTddTest.exprUni("1+2*3"));
    ASSERT_EQ(11, zsTddTest.exprUni("1+2*3+4"));
    ASSERT_EQ(16, zsTddTest.exprUni("1+2*3+4+5"));
    ASSERT_EQ(27, zsTddTest.exprUni("1+2*3+4*5"));
}

TEST(tddTest, universeBracket)
{
    // 全部用mulAdd来实现
    tddTest zsTddTest;
    ASSERT_EQ(3, zsTddTest.exprUni("1+2"));
    ASSERT_EQ(6, zsTddTest.exprUni("1+2+3"));
    ASSERT_EQ(1, zsTddTest.exprUni("2-1"));
    ASSERT_EQ(0, zsTddTest.exprUni("3-2-1"));
    ASSERT_EQ(4, zsTddTest.exprUni("2-1+3"));
    ASSERT_EQ(7, zsTddTest.exprUni("2*3+1"));
    ASSERT_EQ(8, zsTddTest.exprUni("2*3+1*2"));
    ASSERT_EQ(7, zsTddTest.exprUni("1+2*3"));
    ASSERT_EQ(11, zsTddTest.exprUni("1+2*3+4"));
    ASSERT_EQ(16, zsTddTest.exprUni("1+2*3+4+5"));
    ASSERT_EQ(27, zsTddTest.exprUni("1+2*3+4*5"));
}