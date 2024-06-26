 # ライブラリの読み込み
 require "csv"
 
puts "1 → 新規でメモを作成する / 2 → 既存のメモに追記する"

# ユーザーが入力した文字列に対し、chompで末尾の改行を削除
input_val = gets.chomp

if input_val == "1"
    # 1が入力された時の処理
    puts "拡張子を除いたファイル名を入力してください。"
    filename = gets.chomp

    puts "メモの内容を入力してください。完了したらCtrl+Dで保存します。"
    input_memo = $stdin.read
    memo = input_memo.chomp

    CSV.open("#{filename}.csv", 'w') do |csv|
        csv.puts ["#{memo}"]
    end
elsif input_val == "2"
    # 2が入力された時の処理
    puts "内容を追記したいファイル名を入力してください"
    filename = gets.chomp

    puts "追記する内容を入力してください。完了したらCtrl+Dで保存します。"
    input_memo = $stdin.read
    memo = input_memo.chomp

    CSV.open("#{filename}.csv", 'a') do |csv|
        csv.puts ["#{memo}"]
    end
else
    puts "不正な値です。1か2を入力してください。"
end