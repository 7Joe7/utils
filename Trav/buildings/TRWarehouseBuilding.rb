require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/buildings/TRBuilding.rb'

class TRWarehouseBuilding < TRBuilding

  COSTS = [
      {wood:130, clay:160, iron:90, wheat:40, wheat_prod:1},
      {wood:165, clay:205, iron:115, wheat:50, wheat_prod:1},
      {wood:215, clay:260, iron:145, wheat:65, wheat_prod:1},
      {wood:275, clay:335, iron:190, wheat:85, wheat_prod:1},
      {wood:350, clay:430, iron:240, wheat:105, wheat_prod:1},
      {wood:445, clay:550, iron:310, wheat:135, wheat_prod:1},
      {wood:570, clay:705, iron:395, wheat:175, wheat_prod:1},
      {wood:730, clay:900, iron:505, wheat:225, wheat_prod:1},
      {wood:935, clay:1155, iron:650, wheat:290, wheat_prod:1},
      {wood:1200, clay:1475, iron:830, wheat:370, wheat_prod:1},
      {wood:1535, clay:1890, iron:1065, wheat:470, wheat_prod:2},
      {wood:1965, clay:2420, iron:1360, wheat:605, wheat_prod:2},
      {wood:2515, clay:3095, iron:1740, wheat:775, wheat_prod:2},
      {wood:3220, clay:3960, iron:2230, wheat:990, wheat_prod:2},
      {wood:4120, clay:5070, iron:2850, wheat:1270, wheat_prod:2},
      {wood:5275, clay:6490, iron:3650, wheat:1625, wheat_prod:2},
      {wood:6750, clay:8310, iron:4675, wheat:2075, wheat_prod:2},
      {wood:8640, clay:10635, iron:5980, wheat:2660, wheat_prod:2},
      {wood:11060, clay:13610, iron:7655, wheat:3405, wheat_prod:2},
      {wood:14155, clay:17420, iron:9800, wheat:4355, wheat_prod:2}
  ]

  CULTURE_POINTS = [1, 1, 2, 2, 2, 3, 4, 4, 5, 6, 7, 9, 11, 13, 15, 18, 22, 27, 32, 38]

  EFFICIENCY = [1200, 1700, 2300, 3100, 4000, 5000, 6300, 7800, 9600, 11800, 14400, 17600, 21400, 25900, 31300, 37900, 45700, 55100, 66400, 80000]

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
    :warehouse
  end
end