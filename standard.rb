#!/usr/bin/env ruby

# 標準型を試すクラス
class Variable
	@@num = 10
	@@str = "string"
	@@bool = true

	# 配列サンプル
	@@array = ["hoge", "fuga"]

	def hoge
		puts @@num
		puts @@str
		puts @@bool
	end

	def fuga
		puts @@array
		@@array.each do |a|
			puts "each:#{a}"
		end
		puts @@array.join(", ")
	end
end

if __FILE__ == $0
	var = Variable.new
	var.hoge
	var.fuga
end
