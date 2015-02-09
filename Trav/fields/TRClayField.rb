require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/fields/TRField.rb'

class TRClayField < TRField

  COSTS = [
      {:wood=>80.0, :clay=>40.0, :iron=>80.0, :wheat=>50.0, :wheat_prod=>2.0},
      {:wood=>135.0, :clay=>65.0, :iron=>135.0, :wheat=>85.0, :wheat_prod=>1.0},
      {:wood=>225.0, :clay=>110.0, :iron=>225.0, :wheat=>140.0, :wheat_prod=>1.0},
      {:wood=>375.0, :clay=>185.0, :iron=>375.0, :wheat=>235.0, :wheat_prod=>1.0},
      {:wood=>620.0, :clay=>310.0, :iron=>620.0, :wheat=>390.0, :wheat_prod=>1.0},
      {:wood=>1040.0, :clay=>520.0, :iron=>1040.0, :wheat=>650.0, :wheat_prod=>2.0},
      {:wood=>1735.0, :clay=>870.0, :iron=>1735.0, :wheat=>1085.0, :wheat_prod=>2.0},
      {:wood=>2900.0, :clay=>1450.0, :iron=>2900.0, :wheat=>1810.0, :wheat_prod=>2.0},
      {:wood=>4840.0, :clay=>2420.0, :iron=>4840.0, :wheat=>3025.0, :wheat_prod=>2.0},
      {:wood=>8080.0, :clay=>4040.0, :iron=>8080.0, :wheat=>5050.0, :wheat_prod=>2.0},
      {:wood=>13500.0, :clay=>6750.0, :iron=>13500.0, :wheat=>8435.0, :wheat_prod=>2.0},
      {:wood=>22540.0, :clay=>11270.0, :iron=>22540.0, :wheat=>14090.0, :wheat_prod=>2.0},
      {:wood=>37645.0, :clay=>18820.0, :iron=>37645.0, :wheat=>23525.0, :wheat_prod=>2.0},
      {:wood=>62865.0, :clay=>31430.0, :iron=>62865.0, :wheat=>39290.0, :wheat_prod=>2.0},
      {:wood=>104985.0, :clay=>52490.0, :iron=>104985.0, :wheat=>65615.0, :wheat_prod=>2.0},
      {:wood=>175320.0, :clay=>87660.0, :iron=>175320.0, :wheat=>109575.0, :wheat_prod=>3.0},
      {:wood=>292790.0, :clay=>146395.0, :iron=>292790.0, :wheat=>182995.0, :wheat_prod=>3.0},
      {:wood=>488955.0, :clay=>244480.0, :iron=>488955.0, :wheat=>305600.0, :wheat_prod=>3.0},
      {:wood=>816555.0, :clay=>408280.0, :iron=>816555.0, :wheat=>510350.0, :wheat_prod=>3.0},
      {:wood=>1363650.0, :clay=>681825.0, :iron=>1363650.0, :wheat=>852280.0, :wheat_prod=>3.0},
      {:wood=>2277295.0, :clay=>1138650.0, :iron=>2277295.0, :wheat=>1423310.0, :wheat_prod=>3.0},
      {:wood=>3803085.0, :clay=>1901540.0, :iron=>3803085.0, :wheat=>2376925.0, :wheat_prod=>3.0},
      {:wood=>6351150.0, :clay=>3175575.0, :iron=>6351150.0, :wheat=>3969470.0, :wheat_prod=>3.0},
      {:wood=>10606420.0, :clay=>5303210.0, :iron=>10606420.0, :wheat=>6629015.0, :wheat_prod=>3.0},
      {:wood=>17712720.0, :clay=>8856360.0, :iron=>17712720.0, :wheat=>11070450.0, :wheat_prod=>3.0}
  ]

  BUILDING_TIMES = [220, 550, 1080, 1930, 3290, 5470, 8950, 14520, 23430, 37690, 60510, 97010, 155420, 248870, 398390, 637620, 1020390, 1632820, 2612710, 4180540, 6689060]

  def get_costs
    COSTS[@level]
  end

  def get_building_time
    BUILDING_TIMES[@level]
  end

  def get_kind
    :clay
  end
end