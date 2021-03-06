class MoneyCalculator
	
	attr_accessor :total_cost
	attr_accessor :total_change
	attr_accessor :money

	def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)
		@ones = ones.to_i*1
		@fives = fives.to_i*5
		@tens = tens.to_i*10
		@twenties = twenties.to_i*20
		@fifties = fifties.to_i*50
		@hundreds = hundreds.to_i*100
		@five_hundreds = five_hundreds.to_i*500
		@thousands = thousands.to_i*1000

		@money = @ones + @fives + @tens + @twenties + @fifties + @hundreds + @five_hundreds + @thousands
	end

	def cost(price, quantity)
		@total_cost= price*quantity
		return @total_cost
	end

	def total_change
		@total_change = @money - @total_cost
		return @total_change
	end


	def change (cost, amount)
		@cash = { :ones => 0,
			:fives => 0,
			:tens => 0,
			:twenties => 0,
			:fifties => 0,
			:hundreds => 0,
			:five_hundreds => 0,
			:thousands => 0 }
		@total_cost = cost*amount
		@change = @money - @total_cost
		
		
			if @change >= 1000
				thousands = @cash[:thousands].to_i + (@change/1000)
				@change = @change % 1000
			end
			if (@change >= 500  && @change < 1000 ) 
				five_hundreds = @cash[:five_hundreds].to_i  + (@change/500)
				@change = @change % 500
			end
			if (@change >= 100  && @change < 500 ) 
				hundreds= @cash[:hundreds].to_i + (@change/100)
				@change = @change % 100
			end
			if (@change >= 50  && @change < 100 ) 
				fifties = @cash[:fifties].to_i + (@change/50)
				@change = @change % 50
			end
			if (@change >= 20  && @change < 50 ) 
				twenties = @cash[:twenties].to_i + (@change/20)
				@change = @change % 20
			end
			if (@change >= 10  && @change < 20 ) 
				tens = @cash[:tens].to_i + (@change/10)
				@change = @change % 10
			end
			if (@change >= 5  && @change < 10 ) 
				fives = @cash[:fives].to_i + (@change/5)
				@change = @change % 5
			end
			if (@change >= 1  && @change < 5 ) 
				ones = @cash[:ones].to_i + (@change/1)
				@change = @change % 1
			end

		

		@cash = {:ones => ones.to_i,
		:fives => fives.to_i,
		:tens => tens.to_i,
		:twenties => twenties.to_i,
		:fifties => fifties.to_i,
		:hundreds => hundreds.to_i,
		:five_hundreds => five_hundreds.to_i,
		:thousands => thousands.to_i
		}

		return @cash

	end

end
