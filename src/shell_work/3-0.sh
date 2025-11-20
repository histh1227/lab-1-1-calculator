#!/bin/bash

echo "1. .bashrc에 MYENV 환경변수 등록"
echo 'export MYENV="Hello Shell"' >> ~/.bashrc
echo "   >> 등록 완료"

echo "2. 변경 사항 적용"
source ~/.bashrc
echo "   >> 적용 완료"

echo "3. 환경변수 값 출력"
echo "MYENV = $MYENV"

echo "4. 다른 셸에서 값 유지 확인 (예: bash -c 'echo \$MYENV')"
bash -c 'echo "다른 셸에서 MYENV = $MYENV"'

echo "5. 이제 환경변수 해제"
unset MYENV
echo "   >> 현재 셸에서 MYENV 해제됨 : $MYENV"

echo "fin"
