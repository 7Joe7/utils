require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/buildings/TRBuilding.rb'

class TRRallyPoint < TRBuilding

  COSTS = [
      {wood:110, clay:160, iron:90, wheat:70, wheat_prod:1},
      {wood:140, clay:205, iron:115, wheat:90, wheat_prod:1},
      {wood:180, clay:260, iron:145, wheat:115, wheat_prod:1},
      {wood:230, clay:335, iron:190, wheat:145, wheat_prod:1},
      {wood:295, clay:430, iron:240, wheat:190, wheat_prod:1},
      {wood:380, clay:550, iron:310, wheat:240, wheat_prod:1},
      {wood:485, clay:705, iron:395, wheat:310, wheat_prod:1},
      {wood:620, clay:900, iron:505, wheat:395, wheat_prod:1},
      {wood:795, clay:1155, iron:650, wheat:505, wheat_prod:1},
      {wood:1015, clay:1475, iron:830, wheat:645, wheat_prod:1},
      {wood:1300, clay:1890, iron:1065, wheat:825, wheat_prod:2},
      {wood:1660, clay:2420, iron:1360, wheat:1060, wheat_prod:2},
      {wood:2130, clay:3095, iron:1740, wheat:1355, wheat_prod:2},
      {wood:2725, clay:3960, iron:2230, wheat:1735, wheat_prod:2},
      {wood:3485, clay:5070, iron:2850, wheat:2220, wheat_prod:2},
      {wood:4460, clay:6490, iron:3650, wheat:2840, wheat_prod:2},
      {wood:5710, clay:8310, iron:4675, wheat:3635, wheat_prod:2},
      {wood:7310, clay:10635, iron:5980, wheat:4650, wheat_prod:2},
      {wood:9360, clay:13610, iron:7655, wheat:5955, wheat_prod:2},
      {wood:11980, clay:17420, iron:9800, wheat:7620, wheat_prod:2}
  ]

  CULTURE_POINTS = [1, 1, 2, 2, 2, 3, 4, 4, 5, 6, 7, 9, 11, 13, 15, 18, 22, 27, 32, 38]

  EFFICIENCY = []

  BUILDING_TIMES = [2000, 2620, 3340, 4170, 5140, 6260, 7570, 9080, 10830, 12860, 15220, 17950, 21130, 24810, 29080, 34030, 39770, 46440, 54170, 63130]

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
    :rally_point
  end
end