require 'spec_helper'
require './string_calculator'

RSpec.describe StringCalculator, '#calculate_the_string' do
	context '#calculate_the_string' do
		it 'should calculate the given string' do
			StringCalculator.calculate_the_string("hii hello")
		end
	end
end
