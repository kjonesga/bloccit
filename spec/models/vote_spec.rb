require 'rails_helper'

RSpec.describe Vote, type: :model do
	describe "validations" do 
		describe "value validation" do
			it "only allows -1 or 1 as values" do
				vote = Vote.new
				vote.value = -1
				expect( vote.valid? ).to eq(true)
				vote.value = 1
				expect( vote.valid? ).to eq(true)
				vote.value = -10
				expect( vote.valid? ).to eq(false)
			end
		end
	end

  
end

	