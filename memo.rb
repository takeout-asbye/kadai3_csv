require "csv"

puts "1（新規でメモを作成）2（既存のメモを編集する）"
memo_type = gets.chomp.to_s

puts "拡張子を除いたファイル名を入力してください"
file_name = gets.chomp.to_s + '.csv'

if memo_type == "1" then
  puts "メモしたい内容を記入してください"
  puts "完了したらCtrl+Dをおします"
  CSV.open(file_name,'w') do |csv|
    while line = gets
      input = line.chomp
      csv << [input]
    end
  end
elsif memo_type == "2" then
  if File.exist?(file_name) == false then
    puts "既存のメモがありません"
    puts "ファイル名が間違っていませんか"  
  else
    puts "メモしたい内容を記入してください"
    puts "完了したらCtrl+Dをおします"
    CSV.open(file_name,'a') do |csv|
      while line = gets
        input = line.chomp
        csv << [input]
      end
    end
  end
end
