require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/TRVillageManager.rb'
require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/TRConstants.rb'
require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/TROption.rb'

class TRBuilding
  include TRVillageManager
  include TRConstants

  attr_reader :level, :href

  def initialize(level, href)
    @level = level.to_i
    @href = href
  end

  def build(browser)
    @level += 1 if upgrade?(@href, browser)
  end

  def to_s
    get_kind.to_s + ' ' + @level.to_s
  end

  def get_kind
    raise NotImplementedError
  end

  def get_costs
    raise NotImplementedError
  end

  def get_building_time
    raise NotImplementedError
  end

  def get_efficiency
    raise NotImplementedError
  end

  def get_next_efficiency
    raise NotImplementedError
  end

  def get_culture_points
    raise NotImplementedError
  end

  def get_next_culture_points
    raise NotImplementedError
  end

  def self.find_buildings(browser)
    options = []
    BUILDINGS.each do |href|
      enter_village(browser)
      alt = browser.area(href: href).alt
      if alt.match(/ </)
        kind = alt.match(/ </).pre_match
        level = alt.match(/class="level">Level \d/)[0][/\d/]
        building = create_building(kind, level, href)
        growth_boost = EMPTY_PRODUCTION_BOOST.dup
        growth_boost[:wheat] = growth_boost[:wheat] - building.get_costs[:wheat_prod]
        options << TROption.new(building, building.get_costs, { main: building.get_building_time / 3600.0 }, growth_boost, browser)
      end
    end
    options
  end

  def self.create_building(kind, level, href)
    case kind
      when 'Warehouse'
        TRWarehouseBuilding.new(level, href)
      when 'Cranny'
        TRCrannyBuilding.new(level, href)
      when 'Main Building'
        TRMainBuilding.new(level, href)
      when 'Rally Point'
        TRRallyPoint.new(level, href)
    end
  end
end