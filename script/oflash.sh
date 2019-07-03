#!/usr/bin/env bash

# Program:
# Author:
# ChangeLog:
# Readme:
# Tutorial:

help() {
    echo =========================================================================
    echo oflash [jtag_type] [cpu_type] [flash_type] [read_or_write] [offset] [file]
    echo =========================================================================
    exit 1
}

log_error() {
    echo error: $* && exit 1
}

# *****************************************************************************
# 检查参数，构造变量
# 参数全部预处理为小写字母
# *****************************************************************************

set -e

PARAM_NUM=$#
FIRST_PARAM="$1"
FIRST_PARAM_LOWER=$(echo "$FIRST_PARAM" | tr "[:upper:]" "[:lower:]")

# 默认参数
PARAM_JTAG_TYPE="0"
PARAM_CPU_TYPE="1"
PARAM_FLASH_TYPE="0"
PARAM_READ_OR_WRITE="0"
PARAM_OFFSET="0"
PARAM_FILE=""

# 参数初步处理
if [ "$PARAM_NUM" == 0 ]; then
    log_error please give me a paramater that is binary file you want to burn!
elif [ "$PARAM_NUM" == 1 ]; then
    PARAM_FILE=$FIRST_PARAM_LOWER
    test "$PARAM_FILE" = "help" -o "$PARAM_FILE" = "-h" -o "$PARAM_FILE" = "--help" && help
else
    help
fi

echo oflash $PARAM_JTAG_TYPE $PARAM_CPU_TYPE $PARAM_FLASH_TYPE $PARAM_READ_OR_WRITE $PARAM_OFFSET $PARAM_FILE
oflash $PARAM_JTAG_TYPE $PARAM_CPU_TYPE $PARAM_FLASH_TYPE $PARAM_READ_OR_WRITE $PARAM_OFFSET $PARAM_FILE

wait
