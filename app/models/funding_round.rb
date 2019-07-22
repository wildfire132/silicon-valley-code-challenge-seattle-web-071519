class FundingRound
    attr_reader :startup, :venture_capitalist, :type, :investment
    @@all = []
    def initialize(startup,venturecapitalist,type,investment)
        @startup = startup
        @venture_capitalist = venturecapitalist
        @type = type
        @investment = investment
        @@all << self
    end

    def FundingRound.all
        @@all
    end
    
end
