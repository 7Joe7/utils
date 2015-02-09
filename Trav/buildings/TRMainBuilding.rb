require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/buildings/TRBuilding.rb'

class TRMainBuilding < TRBuilding

  COSTS = [
      {wood:70, clay:40, iron:60, wheat:20, wheat_prod:2},
      {wood:90, clay:50, iron:75, wheat:25, wheat_prod:1},
      {wood:115, clay:65, iron:100, wheat:35, wheat_prod:1},
      {wood:145, clay:85, iron:125, wheat:40, wheat_prod:1},
      {wood:190, clay:105, iron:160, wheat:55, wheat_prod:1},
      {wood:240, clay:135, iron:205, wheat:70, wheat_prod:2},
      {wood:310, clay:175, iron:265, wheat:90, wheat_prod:2},
      {wood:395, clay:225, iron:340, wheat:115, wheat_prod:2},
      {wood:505, clay:290, iron:430, wheat:145, wheat_prod:2},
      {wood:645, clay:370, iron:555, wheat:185, wheat_prod:2},
      {wood:825, clay:470, iron:710, wheat:235, wheat_prod:2},
      {wood:1060, clay:605, iron:905, wheat:300, wheat_prod:2},
      {wood:1355, clay:775, iron:1160, wheat:385, wheat_prod:2},
      {wood:1735, clay:990, iron:1485, wheat:495, wheat_prod:2},
      {wood:2220, clay:1270, iron:1900, wheat:635, wheat_prod:2},
      {wood:2840, clay:1625, iron:2435, wheat:810, wheat_prod:3},
      {wood:3635, clay:2075, iron:3115, wheat:1040, wheat_prod:3},
      {wood:4650, clay:2660, iron:3990, wheat:1330, wheat_prod:3},
      {wood:5955, clay:3405, iron:5105, wheat:1700, wheat_prod:3},
      {wood:7620, clay:4355, iron:6535, wheat:2180, wheat_prod:3}
  ]

  CULTURE_POINTS = [2, 3, 3, 4, 5, 6, 7, 9, 10, 12, 15, 18, 21, 26, 31, 37, 44, 53, 64, 77]

  EFFICIENCY = [100, 96, 93, 90, 86, 83, 80, 77, 75, 72, 69, 67, 64, 62, 60, 58, 56, 54, 52, 50]

  BUILDING_TIMES = [2500, 2620, 3220, 3880, 4610, 5410, 6300, 7280, 8380, 9590, 10940, 12440, 14120, 15980, 18050, 20370, 22950, 25830, 29040, 32630]

  def get_costs
    COSTS[@level + 1]
  end



  def get_building_time
    BUILDING_TIMES[@level + 1]
  end

  def get_efficiency
    EFFICIENCY[@level]
  end

  def get_next_efficiency
    EFFICIENCY[@level + 1]
  end

  def get_culture_points
    CULTURE_POINTS[@level]
  end

  def get_next_culture_points
    CULTURE_POINTS[@level + 1]
  end

  def get_kind
    :main
  end
end