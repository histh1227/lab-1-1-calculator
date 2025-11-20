#!/bin/bash

DB_FILE="DB.txt"

# DB 파일이 없으면 생성
if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
fi

while true; do
    echo "==================="
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색"
    echo "5) 종료"
    echo "==================="
    echo -n "메뉴 선택: "
    read choice

    case $choice in
        1)
            echo -n "팀원 이름: "
            read name
            echo -n "생일 (YYYY-MM-DD) 또는 전화번호: "
            read info
            echo "TYPE:INFO | Name:$name | Info:$info" >> "$DB_FILE"
            echo "팀원 정보가 추가되었습니다."
            ;;

        2)
            echo -n "팀원 이름: "
            read name
            echo -n "날짜 (YYYY-MM-DD): "
            read date
            echo -n "수행 내용: "
            read content
            echo "TYPE:WORK | Name:$name | Date:$date | Content:$content" >> "$DB_FILE"
            echo "수행 내용이 기록되었습니다."
            ;;

        3)
            echo -n "검색할 팀원 이름: "
            read name
            echo "===== 검색 결과 ====="
            grep "Name:$name" "$DB_FILE" | grep "TYPE:INFO"
            echo "====================="
            ;;

        4)
            echo -n "검색할 날짜 (YYYY-MM-DD): "
            read date
            echo "===== 검색 결과 ====="
            grep "Date:$date" "$DB_FILE" | grep "TYPE:WORK"
            echo "====================="
            ;;

        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;

        *)
            echo "잘못 입력했습니다. 1~5 중 선택하세요."
            ;;
    esac

    echo "" 
done
