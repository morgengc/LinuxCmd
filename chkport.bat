@echo off

REM 查看平台端口设置是否重复。
REM 输出三列：第一列为端口使用次数，第二列为宏，第三列为端口号
REM 正常情况下，第一列必须全为1
REM Chao.Gao@cisdi.com.cn
REM 2010.11.02

:: csd_info url | gawk -F "=" "{print $1:$2}" | gawk -F ":" "{print $3}" | gawk -F "/" "NF {print $1}" | uniq -c

:: csd_info url | gawk -F "[=:/]" "NR>2 {print $1,$6}" | uniq -f 1 -c

csd_info url | gawk -F "[=:/]" "NR>2 {print $6,$1}" | sort | uniq -c -w 5

