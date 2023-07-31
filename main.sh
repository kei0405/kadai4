#!/usr/bin/bash

# 引数チェック
if [ $# != 2 ]; then
  echo "引数の数が不正です。入力数:$#"
  exit 1
fi

# 第一引数が正の自然数かをチェック
if ! [[ $1 =~ ^[0-9]+$ ]]; then
  echo "第一引数が不正です。入力値:$1"
  exit 1
fi

# 第二引数が正の自然数かをチェック
if ! [[ $2 =~ ^[0-9]+$ ]]; then
  echo "第二引数が不正です。入力値:$2"
  exit 1
fi

# 最大公約数を計算
gcd() {
  if (( $1 % $2 == 0)); then
    echo $2
  else
    gcd $2 $(($1 % $2))
  fi
}

gcd $1 $2
