#!/bin/bash

# 1) DB 폴더 확인/생성
if [ ! -d "DB" ]; then
    echo "DB 폴더가 없어서 생성합니다."
    mkdir DB
else
    echo "DB 폴더가 이미 존재합니다."
fi

cd DB || exit

# 2) 임의의 5개 파일 생성
echo "임의의 5개 파일 생성 중..."
for i in {1..5}; do
    filename="file$i.txt"
    echo "이 파일은 DB 파일 $i 입니다." > "$filename"
done

# 3) 5개 파일 압축
echo "파일 압축 중..."
tar -czf DB_files.tar.gz file{1..5}.txt

cd ..

# 4) train 폴더 생성
if [ ! -d "train" ]; then
    echo "train 폴더 생성"
    mkdir train
else
    echo "train 폴더가 이미 존재합니다."
fi

# 5) DB 폴더의 5개 파일만 링크 생성
echo "train 폴더에 심볼릭 링크 생성 중..."
for i in {1..5}; do
    src="DB/file$i.txt"
    dest="train/file$i.txt"
    # 기존 링크가 있으면 삭제 후 생성
    [ -L "$dest" ] && rm "$dest"
    ln -s "../$src" "$dest"
done

echo "완료: DB 생성, 파일 생성, 압축, train 링크 완료"

