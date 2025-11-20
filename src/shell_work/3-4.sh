#!/bin/bash

scores=()   # 점수 저장 배열

while true; do
    echo "==================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "==================="
    echo -n "메뉴 선택: "
    read choice

    case $choice in

        1)
            echo -n "추가할 점수 입력 (0~100): "
            read score

            if [ $score -ge 0 ] && [ $score -le 100 ]; then
                scores+=($score)
                echo "성적이 추가되었습니다."
            else
                echo "잘못된 점수입니다. 0~100 사이만 입력하세요."
            fi
            ;;

        2)
            echo "입력된 점수 목록:"
            if [ ${#scores[@]} -eq 0 ]; then
                echo "현재 저장된 점수가 없습니다."
            else
                for s in "${scores[@]}"; do
                    echo "$s"
                done
            fi
            ;;

        3)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "평균을 계산할 점수가 없습니다."
            else
                total=0
                for s in "${scores[@]}"; do
                    total=$((total + s))
                done
                avg=$(echo "scale=2; $total / ${#scores[@]}" | bc -l)
                echo "평균 점수: $avg"
            fi
            ;;

        4)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "GPA를 계산할 점수가 없습니다."
            else
                total=0
                for s in "${scores[@]}"; do
                    total=$((total + s))
                done
                avg=$(echo "scale=2; $total / ${#scores[@]}" | bc -l)

                if (( $(echo "$avg >= 90" | bc -l) )); then
                    gpa="A"
                else
                    gpa="B"
                fi

                echo "평균 점수: $avg → 평균 등급(GPA): $gpa"
            fi
            ;;

        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;

        *)
            echo "잘못된 입력입니다. 1~5 중 선택하세요."
            ;;
    esac

    echo ""
done
