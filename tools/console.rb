require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
move_it = Startup.new("Move It!","Katana","Domain1")
mary_jam = Startup.new("Mary's Jams","Mary","Domain2")
finn_blueberry = Startup.new("Finn's Blueberries","Finn","Domain3")
barry = VentureCapitalist.new("Barry",2000000000)
sherry = VentureCapitalist.new("Sherry",1000500000)
daphne = VentureCapitalist.new("Daphne",200000)
move_it.sign_contract(barry,"Donation",12210)
move_it.sign_contract(daphne,"Donation",122110)
mary_jam.sign_contract(barry,"Loan",1220)
barry.offer_contract(finn_blueberry,"Loan",19101)





binding.pry
0 #leave this here to ensure binding.pry isn't the last line