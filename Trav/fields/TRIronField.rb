require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/fields/TRField.rb'

class TRIronField < TRField

  COSTS = [
      {:wood=>100.0, :clay=>80.0, :iron=>30.0, :wheat=>60.0, :wheat_prod=>3.0},
      {:wood=>165.0, :clay=>135.0, :iron=>50.0, :wheat=>100.0, :wheat_prod=>2.0},
      {:wood=>280.0, :clay=>225.0, :iron=>85.0, :wheat=>165.0, :wheat_prod=>2.0},
      {:wood=>465.0, :clay=>375.0, :iron=>140.0, :wheat=>280.0, :wheat_prod=>2.0},
      {:wood=>780.0, :clay=>620.0, :iron=>235.0, :wheat=>465.0, :wheat_prod=>2.0},
      {:wood=>1300.0, :clay=>1040.0, :iron=>390.0, :wheat=>780.0, :wheat_prod=>2.0},
      {:wood=>2170.0, :clay=>1735.0, :iron=>650.0, :wheat=>1300.0, :wheat_prod=>2.0},
      {:wood=>3625.0, :clay=>2900.0, :iron=>1085.0, :wheat=>2175.0, :wheat_prod=>2.0},
      {:wood=>6050.0, :clay=>4840.0, :iron=>1815.0, :wheat=>3630.0, :wheat_prod=>2.0},
      {:wood=>10105.0, :clay=>8080.0, :iron=>3030.0, :wheat=>6060.0, :wheat_prod=>2.0},
      {:wood=>16870.0, :clay=>13500.0, :iron=>5060.0, :wheat=>10125.0, :wheat_prod=>3.0},
      {:wood=>28175.0, :clay=>22540.0, :iron=>8455.0, :wheat=>16905.0, :wheat_prod=>3.0},
      {:wood=>47055.0, :clay=>37645.0, :iron=>14115.0, :wheat=>28230.0, :wheat_prod=>3.0},
      {:wood=>78580.0, :clay=>62865.0, :iron=>23575.0, :wheat=>47150.0, :wheat_prod=>3.0},
      {:wood=>131230.0, :clay=>104985.0, :iron=>39370.0, :wheat=>78740.0, :wheat_prod=>3.0},
      {:wood=>219155.0, :clay=>175320.0, :iron=>65745.0, :wheat=>131490.0, :wheat_prod=>3.0},
      {:wood=>365985.0, :clay=>292790.0, :iron=>109795.0, :wheat=>219590.0, :wheat_prod=>3.0},
      {:wood=>611195.0, :clay=>488955.0, :iron=>183360.0, :wheat=>366715.0, :wheat_prod=>3.0},
      {:wood=>1020695.0, :clay=>816555.0, :iron=>306210.0, :wheat=>612420.0, :wheat_prod=>3.0},
      {:wood=>1704565.0, :clay=>1363650.0, :iron=>511370.0, :wheat=>1022740.0, :wheat_prod=>3.0},
      {:wood=>2846620.0, :clay=>2277295.0, :iron=>853985.0, :wheat=>1707970.0, :wheat_prod=>4.0},
      {:wood=>4753855.0, :clay=>3803085.0, :iron=>1426155.0, :wheat=>2852315.0, :wheat_prod=>4.0},
      {:wood=>7938935.0, :clay=>6351150.0, :iron=>2381680.0, :wheat=>4763360.0, :wheat_prod=>4.0},
      {:wood=>13258025.0, :clay=>10606420.0, :iron=>3977410.0, :wheat=>7954815.0, :wheat_prod=>4.0},
      {:wood=>22140900.0, :clay=>17712720.0, :iron=>6642270.0, :wheat=>13284540.0, :wheat_prod=>4.0}
  ]

  BUILDING_TIMES = [450, 920, 1670, 2880, 4800, 7880, 12810, 20690, 33310, 53500, 85800, 137470, 220160, 352450, 564120, 902790, 1444660, 2311660, 3698850, 5918370]

  def get_costs
    COSTS[@level]
  end

  def get_building_time
    BUILDING_TIMES[@level]
  end

  def get_kind
    :iron
  end
end