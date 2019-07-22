class Startup
    attr_reader :founder, :domain
    attr_accessor :name
    
    @@all = []
    def initialize(name,founder,domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain,name)
        #change both the domain and name
        @domain = domain
        @name = name
    end 

    def self.all
        @@all 
    end

    def self.find_by_founder(founder_name)
        #find the first start up that matches
        #the founder's name given
        Startup.all.find do |start_up|
            if start_up.founder == founder_name
                start_up
            end
        end
    end

    def self.domains
        #return an array of all the domains
        Startup.all.collect do |start_up|
            start_up.domain
        end
    end
    
    def sign_contract(venturecapitalist,type,amount)
        FundingRound.new(self,venturecapitalist,type,amount)
    end

    def nums_funding_rounds
        arr = FundingRound.all.select do |funding_round|
            if funding_round.startup == self
                funding_round
            end
        end
        return arr.length
    end 

    def total_funds
        sum = 0
        FundingRound.all.each do |funding_round|
            if funding_round.startup == self
                sum += funding_round.investment 
            end
        end  
        sum
    end

    def investors
        FundingRound.all.collect do |funding_round|
            if funding_round.startup == self
                funding_round.venture_capitalist
            end
        end
    end

    def big_investors
        FundingRound.all.collect do |funding_round|
            if funding_round.startup == self
                if funding_round.venture_capitalist.total_worth > 1000000000
                    funding_round.venture_capitalist
                end
            end
        end.compact
    end
end
