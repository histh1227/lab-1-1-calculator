#!/bin/bash

run_ls() {
    cmd="ls $@"
    echo "실행 명령어: $cmd"
    eval "$cmd"
}

echo "ls 옵션을 입력하세요:"
read -- opts

run_ls "$opts"
