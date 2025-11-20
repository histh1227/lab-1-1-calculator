#!/bin/bash
while true; do
    echo "=========================="
    echo " 1) 사용자 정보 보기"
    echo " 2) GPU 또는 CPU 사용률 확인"
    echo " 3) 메모리 사용량 확인"
    echo " 4) 디스크 사용량 확인"
    echo " 5) 종료"
    echo "=========================="
    echo -n "메뉴 선택: "
    read choice
    case $choice in
        1)
            echo ">> 현재 로그인한 사용자 정보"
            who
            echo ""
            ;;
        2)
            echo ">> GPU 또는 CPU 사용률 확인"
            if command -v nvidia-smi >/dev/null 2>&1; then
                echo "[GPU 사용률 (nvidia-smi)]"
                nvidia-smi
            else
                echo "[GPU 없음 → CPU 사용률 표시(top 명령어)]"
                echo "상위 5개 프로세스 CPU 사용률:"
                top -b -n 1 | head -n 12
            fi
            echo ""
            ;;
        3)
            echo ">> 메모리 사용량 확인 (free -h)"
            free -h
            echo ""
            ;;
        4)
            echo ">> 디스크 사용량 확인 (df -h)"
            df -h
            echo ""
            ;;
        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;
        *)
            echo "잘못 입력했습니다. 1~5 중에 선택하세요."
            ;;
    esac
    echo "" 
done
