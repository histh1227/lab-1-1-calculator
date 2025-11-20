#!/bin/bash
# 인자 개수 체크( 2개 이상 요구)
if [ $# -lt 2 ]; then
    echo "에러: 이 스크립트는 최소 2개의 인자를 필요로 합니다."
    echo "사용법: $0 arg1 arg2 [arg3 ...]"
    exit 1
fi

# 현재 디렉토리의 myprog.py 실행 
./myprog.py "$@"
