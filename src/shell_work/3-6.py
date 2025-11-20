#!/usr/bin/env python3
# myprog.py
# 사용법: ./myprog.py arg1 arg2 [arg3 ...]
import sys

def main():
    args = sys.argv[1:]
    print("=== PROGRAM START ===")
    # 인자가 2개 이상인지 확인
    if len(args) < 2:
        print("에러: 인자를 2개 이상 전달해주세요.")
        print("사용법: ./myprog.py arg1 arg2 [arg3 ...]")
        print("=== PROGRAM END (error) ===")
        sys.exit(1)

    # 전달된 인자 출력
    print(f"입력된 인자 개수: {len(args)}")
    print("입력된 인자들:")
    for i, a in enumerate(args, start=1):
        print(f"  arg{i}: {a}")

    # (여기에 실제 작업을 추가 가능)

    print("=== PROGRAM END ===")

if __name__ == "__main__":
    main()
