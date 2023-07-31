# 引数のテスト
## 引数が無い場合エラーメッセージが表示されること
echo "引数の数が不正です。入力数:0" > /tmp/$$-ans
./main.sh > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "テスト1-1" >> /tmp/$$-error.log

## 引数が一つの場合エラーメッセージが表示されること
echo "引数の数が不正です。入力数:1" > /tmp/$$-ans
./main.sh 2 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "テスト1-2" >> /tmp/$$-error.log

## 引数が三つの場合エラーメッセージが表示されること
echo "引数の数が不正です。入力数:3" > /tmp/$$-ans
./main.sh 2 3 4 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "テスト1-3" >> /tmp/$$-error.log

## 第一引数が文字の場合エラーメッセージが表示されること
echo "第一引数が不正です。入力値:a" > /tmp/$$-ans
./main.sh a 3 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "テスト1-4" >> /tmp/$$-error.log

## 第一引数が負の数の場合エラーメッセージが表示されること
echo "第一引数が不正です。入力値:-1" > /tmp/$$-ans
./main.sh -1 3 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "テスト1-5" >> /tmp/$$-error.log

## 第二引数が文字の場合エラーメッセージが表示されること
echo "第二引数が不正です。入力値:a" > /tmp/$$-ans
./main.sh 1 a > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "テスト1-6" >> /tmp/$$-error.log

## 第二引数が負の数の場合エラーメッセージが表示されること
echo "第二引数が不正です。入力値:-1" > /tmp/$$-ans
./main.sh 1 -1 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "テスト1-7" >> /tmp/$$-error.log

# 最大公約数のテスト
## 2 4 -> 2
echo "2" > /tmp/$$-ans
./main.sh 2 4 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "テスト3-1" >> /tmp/$$-error.log

## 1000 100 -> 100
echo "100" > /tmp/$$-ans
./main.sh 1000 100 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "テスト3-2" >> /tmp/$$-error.log

## 12 8 -> 4
echo "4" > /tmp/$$-ans
./main.sh 12 8 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "テスト3-3" >> /tmp/$$-error.log

# 結果を比較
if [ -f /tmp/$$-error.log ];then
  cat /tmp/$$-error.log 1>&2
  rm -f /tmp/$$-*
  exit 1
fi

