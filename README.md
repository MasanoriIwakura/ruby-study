# Rubyの勉強

# Rubyについて

>オープンソースの動的なプログラミング言語で、 シンプルさと高い生産性を備えています。 エレガントな文法を持ち、自然に読み書きができます。

[参考](https://www.ruby-lang.org/ja/)

- オブジェクト指向
- スクリプト言語(コンパイル不要、インタプリンタ)
- 作者はMatzさん(まつもとゆきひろさん)

## 開発環境構築

Macの場合、以下でOK(HomeBrewがインストールされていること)

```bash
# rbenvはRubyのバージョン管理用
# ruby-buildはrbenvで複数バージョンを入れるために必要
brew install rbenv ruby-build
```

`.bash_profile`の編集をします。

```bash
vim ~/.bash_profile
# 以下の内容を追記
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
```

編集後、以下のコマンドを実行して適用

```bash
source .bash_profile
```

Rubyをインストールします。

```bash
# インストール可能なバージョンを検索
rbenv install -l

# 執筆時点では2.6.3が最新のため、2.6.3をインストール
rbenv install 2.6.3

# グローバル適用(rubyコマンドで実行するバージョンを指定)
rbenv global 2.6.3
```

# 基本構文

## 標準出力(コンソール出力)

```ruby
puts "Hello"
```

## 変数宣言

```ruby
# 整数
a = 1
# 浮動小数点数
b = 1.1
# 文字列
c = "string"
# Booleanは存在しない
# TrueClassとFalseClassで代用
d = true
e = false
```

## 四則演算・文字列結合

```ruby
a = 3
b = 2
puts a + b # 加算 5
puts a - b # 減算 1
puts a * b # 乗算 6
puts a / b # 除算 小数点以下切り捨てで1
puts a % b # 剰余算 3/2の余りで1
puts a ** b # べき乗 3の2条で9

c = "aaa"
d = "bbb"
# 文字列結合
puts c + d # aaabbb
```

## 配列

```ruby
a = [1, 2, 3]
b = ["a", "b", "c"]
```

## 分岐

```ruby
a = 1

# if文
if a == 0
  puts "zero"
elsif a == 1
  puts "one"
else
  puts "other"
end
# 出力結果は"one"

# case文
case a
  when 0
    puts "zero"
  when 1
    puts "one"
  else
    puts "other"
end
# 出力結果は"one"
```

## 繰り返し(ループ)

```ruby
a = [1, 2, 3, 4, 5]
# 多言語でよく使う標準的なfor文
for i in 0..(a.length-1)
  puts a[i]
end

# 拡張for文、foreach
a.each do |num|
  puts num
end
# または
for num in a
  puts num
end

# while(先判定)
j = 0
while j < 10
  puts j
  j += 1
end

# loop do(後判定)
k = 0
loop do
  puts k
  k += 1
  break if k > 10
end
```

## 関数

```ruby
# 戻り値なし
def hoge
  puts "hoge"
end

# 戻り値、引数あり
def add(a, b)
  return a + b
end

# 呼び出し
hoge # hoge
puts add(1, 2) # 3
```

## クラス

`public`や`private`、`protected`を使用することでアクセスレベルの制限も行える。
(今回は割愛)


```ruby
class Human
  def initialize(name, age)
    # @はインスタンス変数
    # @@の場合はStatic変数になるらしい
    @name = name
    @age = age
  end

  def getName
    return @name
  end

  def getAge
    return @age
  end
end

# 使用例
human = Human.new("hoge", 12)
puts human.getName # hoge
puts human.getAge # 12

# 継承
class Student < Human
  def initialize(name, age, school)
    super(name, age)
    @school = school
  end
    
  def getSchool
    return @school
  end
end

student = Student.new("Taro", 16, "High School")
puts student.getName
puts student.getAge
puts student.getSchool
```

## ハッシュ

配列の他に、Key/Value方式で格納するリストもある。

```ruby
hash = {}
hash["one"] = 1
hash["two"] = 2
hash["three"] = 3

hash.each do |key, value|
  puts "Key:#{key}, Value:#{value}"
end

=begin
[実行結果]
Key:one, Value:1
Key:two, Value:2
Key:three, Value:3
=end
```

## 例外処理

```ruby
begin
  i = 1
  j = i / 0 # 0除算
rescue ZeroDivisionError => zde
  # 例外時の処理
  puts "0除算はダメよ"
  puts zde.message
  puts zde.backtrace.inspect
ensure
  # 例外に関係なく必ず行う処理
  # 多言語のfinallyと同じ
  # クローズ処理とか入れる
end

=begin
[実行結果]
0除算はダメよ
divided by 0
["Main.rb:3:in `/'", "Main.rb:3:in `<main>'"]
=end
```