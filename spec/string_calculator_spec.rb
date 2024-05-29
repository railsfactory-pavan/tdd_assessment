require 'spec_helper'
require './string_calculator'

RSpec.describe StringCalculator, '#calculate_the_string' do
	context '#calculate_the_string' do
		it 'should calculate the given string when slash n and numbers are present' do
			result = StringCalculator.new
			result = result.calculate_the_string("/n,hii,/n,2,3,/n,4,5,6,/n,hello,/n,10")
			expect(result).to eq 30
		end

		it 'should calculate the given string when slash n and numbers are not present' do
			result = StringCalculator.new
			result = result.calculate_the_string("/n,hii,/n,hello")
			expect(result).to eq 0
		end
	end
end
