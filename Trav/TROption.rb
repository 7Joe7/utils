class TROption

  attr_accessor :costs, :building_times, :production_boosts, :valid, :something

  def initialize(something, costs, building_times = nil, production_boosts, browser)
    @something = something
    @costs = costs
    @building_times = building_times
    @production_boosts = production_boosts
    @valid = true
    @browser = browser
  end

  def execute?
    success = false
    if something.respond_to?(:build)
      if @something.build(@browser)
        success = true
      end
    end
    success
  end

  def to_s
    "#{@something} - #{@valid}: costs are #{@costs}, building time is #{building_times} and production boosts are #{production_boosts}"
  end
end