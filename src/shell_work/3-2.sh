#!/bin/bash

echo "x 값을 공백으로 여러 개 입력하세요:"
read -a values   # 배열 입력

for x in "${values[@]}"; do
    # y = 1/2 * x^2 계산 (실수 계산)
    y=$(echo "scale=5; 0.5 * ($x * $x)" | bc -l)
    echo "x = $x  →  y = $y"
done
