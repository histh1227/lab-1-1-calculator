#!/bin/bash

# 두 개의 인자가 전달되었는지 확인
if [ $# -ne 2 ]; then
    echo "사용법: $0 숫자1 숫자2"
    exit 1
fi

# 파라미터 변수
a=$1
b=$2

# 정수 사칙연산
sum=$((a + b))
sub=$((a - b))
mul=$((a * b))
# 나눗셈은 0 나누기 방지
if [ $b -ne 0 ]; then
    div=$((a / b))
else
    div="0으로 나눌 수 없음"
fi

echo "입력값: $a, $b"
echo "더하기: $sum"
echo "빼기: $sub"
echo "곱하기: $mul"
echo "나누기: $div"
