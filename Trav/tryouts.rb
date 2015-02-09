require 'TRDecisionMaker'
require 'TROption'
require 'fields/TRWoodField'
require 'TRExecutor'
require 'TRConstants'
require '../data_mining/helper_methods'

def try(browser)
  puts_data_from_tr_table('http://travian.kirilloid.ru/build.php#b=4&mb=1&s=1.36', browser)
end

# dm = TRDecisionMaker.new({wood: 216.0, clay: 242.0, iron: 220.0, wheat: 219.0}, {wood: 17292.0, clay: 16878.0, iron: 15796.0, wheat: 17375.0})
# dm.define_goal({wood: 100000.0, clay: 100000.0, iron: 100000.0, wheat: 100000.0})
#
# result_time = 0
# time = 1
# while time > 0
#   decision, time, time_till_built = dm.decide
#   puts decision
#   puts time
#   dm.update_state(decision, time_till_built)
#   puts dm.prod_abilities
#   puts dm.actual_states
#   result_time += time_till_built
# end
# puts result_time
#
# puts TRWoodField.new(1, '').get_costs