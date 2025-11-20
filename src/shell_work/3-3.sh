#!/bin/bash

echo "점수들을 공백으로 여러 개 입력하세요 (0~100):"
read -a scores   # 배열로 입력 받음

total=0
count=0
grade_sum=0    # A=1, B=0 으로 환산해서 평균 등급 계산

echo "===== 개별 등급 ====="

for s in "${scores[@]}"; do
    # 점수 범위 확인
    if [ $s -lt 0 ] || [ $s -gt 100 ]; then
        echo "잘못된 입력: $s (0~100 사이여야 함)"
        continue
    fi

    # 등급 판정
    if [ $s -ge 90 ]; then
        grade="A"
        grade_sum=$((grade_sum + 1))
    else
        grade="B"
    fi

    echo "점수: $s → 등급: $grade"

    total=$((total + s))
    count=$((count + 1))
done

echo "====================="

# 평균 점수
if [ $count -gt 0 ]; then
    avg=$(echo "scale=2; $total / $count" | bc -l)
else
    echo "유효한 점수가 없습니다."
    exit 1
fi

# 평균 등급 판단
if (( $(echo "$avg >= 90" | bc -l) )); then
    avg_grade="A"
else
    avg_grade="B"
fi

echo "평균 점수: $avg"
echo "평균 등급: $avg_grade"
