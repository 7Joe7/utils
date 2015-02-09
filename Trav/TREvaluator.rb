require 'TRHelper'

class TREvaluator

  def get_lowest(lowest_o, new_o)
    if lowest_o.nil?
      lowest_o = new_o
    elsif lowest_o.something.level > new_o.something.level
      lowest_o.valid = false
      lowest_o = new_o
    else
      new_o.valid = false
    end
    lowest_o
  end

  def time_till_affordable(option, actual_data)
    time = 0
    actual_data[:actual_states].each do |key, amount|
      if option.costs[key] > amount
        needed = Float(option.costs[key] - amount)
        time = needed/actual_data[:prod_abilities][key] if needed/actual_data[:prod_abilities][key] > time
      end
    end
    time
  end

  def count_time_to_goal(option, actual_data)
    max_time = 0
    times_to_reach_goal = {}
    time_till_affordable = time_till_affordable(option, actual_data)
    time_till_built = option.building_times[:main] + time_till_affordable
    actual_data[:goal_commodities].each do |key, amount|
      needed = amount + option.costs[key] - actual_data[:actual_states][key]
      if option.building_times[:main] * actual_data[:prod_abilities][key] > needed
        times_to_reach_goal[key] = needed/actual_data[:prod_abilities][key]
      else
        before_built_production = time_till_built * actual_data[:prod_abilities][key]
        production_after_built = actual_data[:prod_abilities][key] + option.production_boosts[key]
        left_to_produce = needed - before_built_production
        time_after_built = left_to_produce / production_after_built
        times_to_reach_goal[key] = time_after_built + time_till_built
      end
      max_time = times_to_reach_goal[key] if times_to_reach_goal[key] > max_time
    end
    max_time
  end

  def update_state(decision, actual_data)
    TRHelper.plus!(actual_data[:actual_states], TRHelper.time(actual_data[:prod_abilities], decision.building_times[:main]))
    TRHelper.subtract!(actual_data[:actual_states], decision.costs)
    TRHelper.plus!(actual_data[:prod_abilities], decision.production_boosts)
  end

  def update_state_waiting(time, actual_data)
    TRHelper.plus!(actual_data[:actual_states], TRHelper.time(actual_data[:prod_abilities], time))
  end

  def evaluate_shortest(valid_options, actual_data)
    best_o = valid_options[0]
    best_time = count_time_to_goal(best_o, actual_data)
    valid_options[1..-1].each do |o|
      new_time = count_time_to_goal(o, actual_data)
      case best_time <=> new_time
        when 1
          best_o.valid = false
          best_o = o
          best_time = new_time
        when -1
          o.valid = false
        else
      end
    end
    return best_o, best_time
  end
end