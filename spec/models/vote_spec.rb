describe Vote do
	# above implies there is a vote model

	describe "validations" do 
		# above implies there are some validations on said model

		describe "value validation" do
			# above implies there is a value field on said model
			# above implies there is a validation on the value field

			# it "is valid for 1 or -1" do
			# end

			# it "is invalid for something other than 1 or -1" do
			# end

			it "only allows -1 or 1 as values" do
				# above implies the validate is to permit 1 or -1 as the value for value

				# 1. create an instance of the vote model
				# 2. assign it a value of something other than 1 or -1
				# 3. confirm it is an invalid model
				# 4. update value to be 1 or -1
				# 5. confirm it is a valid model

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