require 'spec_helper'
require './string_calculator'

RSpec.describe StringCalculator, '#calculate_the_string' do
	context '#calculate_the_string' do
		it 'should calculate the given string' do
			result = StringCalculator.calculate_the_string("hii hello")
			expect(result).to eq 9
		end
	end
end
