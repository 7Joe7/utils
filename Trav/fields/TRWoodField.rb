require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/fields/TRField.rb'

class TRWoodField < TRField

  COSTS = [
      {wood: 40, clay: 100, iron: 50, wheat: 60, wheat_prod: 2},
      {wood: 65, clay: 165, iron: 85, wheat: 100, wheat_prod: 1},
      {wood: 110, clay: 280, iron: 140, wheat: 165, wheat_prod: 1},
      {wood: 185, clay: 465, iron: 235, wheat: 280, wheat_prod: 1},
      {wood: 310, clay: 780, iron: 390, wheat: 465, wheat_prod: 1},
      {wood: 520, clay: 1300, iron: 650, wheat: 780, wheat_prod: 2},
      {wood: 870, clay: 2170, iron: 1085, wheat: 1300, wheat_prod: 2},
      {wood: 1450, clay: 3625, iron: 1810, wheat: 2175, wheat_prod: 2},
      {wood: 2420, clay: 6050, iron: 3025, wheat: 3630, wheat_prod: 2},
      {wood: 4040, clay: 10105, iron: 5050, wheat: 6060, wheat_prod: 2},
      {wood: 6750, clay: 16870, iron: 8435, wheat: 10125, wheat_prod: 2},
      {wood: 11270, clay: 28175, iron: 14090, wheat: 16905, wheat_prod: 2},
      {wood: 18820, clay: 47055, iron: 23525, wheat: 28230, wheat_prod: 2},
      {wood: 31430, clay: 78580, iron: 39290, wheat: 47150, wheat_prod: 2},
      {wood: 52490, clay: 131230, iron: 65615, wheat: 78740, wheat_prod: 2},
      {wood: 87660, clay: 219155, iron: 109575, wheat: 131490, wheat_prod: 3},
      {wood: 146395, clay: 365985, iron: 182995, wheat: 219590, wheat_prod: 3},
      {wood: 244480, clay: 611195, iron: 305600, wheat: 366715, wheat_prod: 3},
      {wood: 408280, clay: 1020695, iron: 510350, wheat: 612420, wheat_prod: 3},
      {wood: 681825, clay: 1704565, iron: 852280, wheat: 1022740, wheat_prod: 3},
      {wood: 1138650, clay: 2846620, iron: 1423310, wheat: 1707970, wheat_prod: 3},
      {wood: 1901540, clay: 4753855, iron: 2376925, wheat: 2852315, wheat_prod: 3},
      {wood: 3175575, clay: 7938935, iron: 3969470, wheat: 4763360, wheat_prod: 3},
      {wood: 5303210, clay: 13258025, iron: 6629015, wheat: 7954815, wheat_prod: 3},
      {wood: 8856360, clay: 22140900, iron: 11070450, wheat: 13284540, wheat_prod: 3}
  ]

  BUILDING_TIMES = [260, 620, 1190, 2100, 3560, 5890, 9620, 15590, 25150, 40440, 64900, 104050, 166680, 266880, 427210, 683730, 1094170, 1750880, 2801600, 4482770]

  def get_costs
    COSTS[@level]
  end

  def get_building_time
    BUILDING_TIMES[@level]
  end

  def get_kind
    :wood
  end
end