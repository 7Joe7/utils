require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/buildings/TRBuilding.rb'

class TRCrannyBuilding < TRBuilding

  COSTS = [
      {wood:40, clay:50, iron:30, wheat:10, wheat_prod:0},
      {wood:50, clay:65, iron:40, wheat:15, wheat_prod:0},
      {wood:65, clay:80, iron:50, wheat:15, wheat_prod:0},
      {wood:85, clay:105, iron:65, wheat:20, wheat_prod:0},
      {wood:105, clay:135, iron:80, wheat:25, wheat_prod:0},
      {wood:135, clay:170, iron:105, wheat:35, wheat_prod:1},
      {wood:175, clay:220, iron:130, wheat:45, wheat_prod:1},
      {wood:225, clay:280, iron:170, wheat:55, wheat_prod:1},
      {wood:290, clay:360, iron:215, wheat:70, wheat_prod:1},
      {wood:370, clay:460, iron:275, wheat:90, wheat_prod:1}
  ]

  CULTURE_POINTS = [1, 1, 2, 2, 2, 3, 4, 4, 5, 6]

  EFFICIENCY = [100, 130, 170, 220, 280, 360, 460, 600, 770, 1000]

  BUILDING_TIMES = [750, 1170, 1660, 2220, 2880, 3640, 4520, 5540, 6730, 8110]

  def get_costs
    COSTS[@level]
  end

  def get_building_time
    BUILDING_TIMES[@level]
  end

  def get_efficiency
    EFFICIENCY[@level - 1]
  end

  def get_next_efficiency
    EFFICIENCY[@level]
  end

  def get_culture_points
    CULTURE_POINTS[@level - 1]
  end

  def get_next_culture_points
    CULTURE_POINTS[@level]
  end

  def get_kind
    :cranny
  end
end