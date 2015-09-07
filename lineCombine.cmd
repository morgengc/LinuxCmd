@echo off

REM 以行为单位，将两个文件的内容合并输出
REM 输入：文件1，文件2
REM 输出：文件2内容在前，文件1内容在后，按行合并

gawk "NR==FNR {a[FNR]=$0} NR>FNR { print $0,a[FNR]}" %1 %2

