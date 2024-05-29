require 'debug'

class StringCalculator
	NEGATIVES_MSG = "Negatives not allowed"
	START_OF_CUSTOMDELIM_INDEX = 3
	TOO_LARGE = 1001

	def calculate_the_string(string_value)
		cleaned = clean(string_value)

		unless cleaned.include?(",")
			return handle_single_number(cleaned)
		end

		cleaned = replace_delimters(cleaned)
		actual = turn_into_actual_numbers(cleaned)
		disallow_negatives(actual)
		good_numbers = filter_allowable_numbers(actual)

		return good_numbers.inject(&:+)
	end

	def clean(numbers)
		numbers.strip.gsub("\n", ",")
	end

	def handle_single_number(number)
		raise "#{NEGATIVES_MSG} #{number}" if number.include?("-")
		return number.to_i
	end

	def replace_delimters(numbers)
		return numbers unless numbers.include?("//")

		endindex = numbers.index(",")
		delims = numbers[START_OF_CUSTOMDELIM_INDEX..endindex].delete("[").split("]")

		delims.each do |delim|
			numbers = numbers.gsub!(delim,",")
		end

		delim_char = numbers[2].chr

		return numbers.gsub(delim_char,",")
	end

	def turn_into_actual_numbers(numbers)
		numbers.split(',').map(&:to_i)
	end

	def disallow_negatives(numbers)
		negatives = numbers.find_all do |number|
			number < 0
		end

		raise "#{NEGATIVES_MSG} #{negatives}" unless negatives.empty?
	end

	def filter_allowable_numbers(numbers)
		numbers.find_all do |number|
			number < TOO_LARGE
		end
	end
end

puts "Result..."
obj = StringCalculator.new
puts obj.calculate_the_string("/n,hii,/n,2,3,/n,4,5,6,/n,hello,/n,10")