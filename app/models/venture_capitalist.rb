class VentureCapitalist
attr_accessor :name, :total_worth
@@all = []
    def initialize(name,worth)
        @name = name
        @total_worth = worth
        @@all << self
    end

    def VentureCapitalist.all
        @@all
    end

    def VentureCapitalist.tres_commas_club
        #returns an array of all with 
        #worth > 1,000,000,000
        VentureCapitalist.all.select do |venture_capitalist|
            if venture_capitalist.total_worth > 1000000000
                venture_capitalist
            end
        end
    end

    def offer_contract(startup,type,amount)
        FundingRound.new(startup,self,type,amount)
    end
    
    def funding_rounds
        FundingRound.all.collect do |funding_round|
            if funding_round.venture_capitalist == self
                funding_round
            end
        end
    end

    def portfolio 
        FundingRound.all.collect do |funding_round|
            if funding_round.venture_capitalist == self
                funding_round.startup
            end
        end
    end

    def biggest_investment
        arr = []
        FundingRound.all.each do |funding_round|
            if funding_round.venture_capitalist == self
                arr << funding_round.investment
            end
        end
        arr.sort
        return arr[-1]
    end

    def invested(domain_string)
        FundingRound.all.each do |funding_round|
            if funding_round.startup.domain == domain_string
                return funding_round.investment
            end
        end
    end        

end
