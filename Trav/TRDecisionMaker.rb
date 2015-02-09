require 'TROption'
require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/TREvaluator.rb'

# principy:
#
# surovina je tak dobra, jako jsou moznosti jejiho vyuziti k dosazeni planu
# konecny plan je rozlozen na mnoho malych zvladnutelnych planu
# male plany jsou rozlozeny na mnoho malych dilcich rozhodnuti

class TRDecisionMaker

  DO_NOTHING = TROption.new(:do_nothing, {wood: 0.0, clay: 0.0, iron: 0.0, wheat: 0.0, wheat_prod: 0.0}, {main: 0.0}, {wood: 0.0, clay: 0.0, iron: 0.0, wheat: 0.0}, nil)

  EVALUATOR = TREvaluator.new

  HAS_ENOUGH_CROP_PROD = Proc.new do |valid_options, actual_data|
    valid_options.each do |o|
      if actual_data[:free_crop] < o.costs[:wheat_prod]
        o.valid = false
      end
    end
  end

  LOWEST_FIELD_LEVELS = Proc.new do |valid_options, actual_data|
    field_options = valid_options.find_all { |pot_field| pot_field.something.is_a?(TRField) }
    wood_lowest = nil
    clay_lowest = nil
    iron_lowest = nil
    wheat_lowest = nil
    field_options.each do |o|
      case o.something.get_kind
        when :wood
          wood_lowest = EVALUATOR.get_lowest(wood_lowest, o)
        when :clay
          clay_lowest = EVALUATOR.get_lowest(clay_lowest, o)
        when :iron
          iron_lowest = EVALUATOR.get_lowest(iron_lowest, o)
        when :wheat
          wheat_lowest = EVALUATOR.get_lowest(wheat_lowest, o)
      end
    end
  end

  BIGGER_PROD_BOOST = Proc.new do |valid_options, actual_data|
    best_o = valid_options[0]
    valid_options[1..-1].each do |o|
      case greater(best_o.production_boosts, o.production_boosts)
        when 1
          o.valid = false
        when -1
          best_o.valid = false
          best_o = o
        else
      end
    end
  end

  SHORTER_TIME_TO_GOAL = Proc.new do |valid_options, actual_data|
    best_o, best_time = EVALUATOR.evaluate_shortest(valid_options, actual_data)
    if best_o == DO_NOTHING
      valid_options.delete(DO_NOTHING)
      sim_actual_data = {goal_commodities: actual_data[:goal_commodities], prod_abilities: actual_data[:prod_abilities].dup, actual_states: actual_data[:actual_states].dup}
      decision_f, _ = EVALUATOR.evaluate_shortest(valid_options, sim_actual_data)
      sim_time = decision_f.building_times[:main]
      EVALUATOR.update_state(decision_f, sim_actual_data)
      70.times do
        decision, pot_shortest = EVALUATOR.evaluate_shortest(valid_options, sim_actual_data)
        EVALUATOR.update_state(decision, sim_actual_data)
        if (sim_time + pot_shortest) < best_time
          DO_NOTHING.valid = false
          decision_f.valid = true
        end
      end
      valid_options << DO_NOTHING
    end
  end

  def initialize(prod_abilities, actual_states, free_crop)
    @criteria = [HAS_ENOUGH_CROP_PROD, LOWEST_FIELD_LEVELS, SHORTER_TIME_TO_GOAL, BIGGER_PROD_BOOST]
    @options = [] # DO_NOTHING
    @actual_data = { free_crop: free_crop, actual_states: actual_states, prod_abilities: prod_abilities }
  end

  def add_option(option)
    @options << option
  end

  def remove_option(option)
    @options.delete(option)
  end

  def remove_all_options
    @options = []
  end

  def decide
    @options.each { |option| option.valid = true }
    valid_options = @options.dup
    @criteria.each do |criterion|
      valid_options = valid_options.find_all { |o| o.valid }
      if valid_options.size > 1
        criterion.call(valid_options, @actual_data)
      else
        break
      end
    end
    valid_options[0]
  end

  def update_state(decision)
    EVALUATOR.update_state(decision, @actual_data)
  end

  def wait_till_affordable(decision)
    time = EVALUATOR.time_till_affordable(decision, @actual_data)
    EVALUATOR.update_state_waiting(time, @actual_data)
    time * 3600.0
  end

  def define_goal(goal_commodities)
    @actual_data[:goal_commodities] = goal_commodities
  end
end