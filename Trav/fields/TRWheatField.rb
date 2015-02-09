require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/fields/TRField.rb'

class TRWheatField < TRField

  COSTS = [
      {:wood=>70.0, :clay=>90.0, :iron=>70.0, :wheat=>20.0, :wheat_prod=>0.0},
      {:wood=>115.0, :clay=>150.0, :iron=>115.0, :wheat=>35.0, :wheat_prod=>0.0},
      {:wood=>195.0, :clay=>250.0, :iron=>195.0, :wheat=>55.0, :wheat_prod=>0.0},
      {:wood=>325.0, :clay=>420.0, :iron=>325.0, :wheat=>95.0, :wheat_prod=>0.0},
      {:wood=>545.0, :clay=>700.0, :iron=>545.0, :wheat=>155.0, :wheat_prod=>0.0},
      {:wood=>910.0, :clay=>1170.0, :iron=>910.0, :wheat=>260.0, :wheat_prod=>1.0},
      {:wood=>1520.0, :clay=>1950.0, :iron=>1520.0, :wheat=>435.0, :wheat_prod=>1.0},
      {:wood=>2535.0, :clay=>3260.0, :iron=>2535.0, :wheat=>725.0, :wheat_prod=>1.0},
      {:wood=>4235.0, :clay=>5445.0, :iron=>4235.0, :wheat=>1210.0, :wheat_prod=>1.0},
      {:wood=>7070.0, :clay=>9095.0, :iron=>7070.0, :wheat=>2020.0, :wheat_prod=>1.0},
      {:wood=>11810.0, :clay=>15185.0, :iron=>11810.0, :wheat=>3375.0, :wheat_prod=>1.0},
      {:wood=>19725.0, :clay=>25360.0, :iron=>19725.0, :wheat=>5635.0, :wheat_prod=>1.0},
      {:wood=>32940.0, :clay=>42350.0, :iron=>32940.0, :wheat=>9410.0, :wheat_prod=>1.0},
      {:wood=>55005.0, :clay=>70720.0, :iron=>55005.0, :wheat=>15715.0, :wheat_prod=>1.0},
      {:wood=>91860.0, :clay=>118105.0, :iron=>91860.0, :wheat=>26245.0, :wheat_prod=>1.0},
      {:wood=>153405.0, :clay=>197240.0, :iron=>153405.0, :wheat=>43830.0, :wheat_prod=>2.0},
      {:wood=>256190.0, :clay=>329385.0, :iron=>256190.0, :wheat=>73195.0, :wheat_prod=>2.0},
      {:wood=>427835.0, :clay=>550075.0, :iron=>427835.0, :wheat=>122240.0, :wheat_prod=>2.0},
      {:wood=>714485.0, :clay=>918625.0, :iron=>714485.0, :wheat=>204140.0, :wheat_prod=>2.0},
      {:wood=>1193195.0, :clay=>1534105.0, :iron=>1193195.0, :wheat=>340915.0, :wheat_prod=>2.0},
      {:wood=>1992635.0, :clay=>2561960.0, :iron=>1992635.0, :wheat=>569325.0, :wheat_prod=>2.0},
      {:wood=>3327700.0, :clay=>4278470.0, :iron=>3327700.0, :wheat=>950770.0, :wheat_prod=>2.0},
      {:wood=>5557255.0, :clay=>7145045.0, :iron=>5557255.0, :wheat=>1587785.0, :wheat_prod=>2.0},
      {:wood=>9280620.0, :clay=>11932225.0, :iron=>9280620.0, :wheat=>2651605.0, :wheat_prod=>2.0},
      {:wood=>15498630.0, :clay=>19926810.0, :iron=>15498630.0, :wheat=>4428180.0, :wheat_prod=>2.0}
  ]

  BUILDING_TIMES = [150, 440, 900, 1650, 2830, 4730, 7780, 12640, 20430, 32880, 52810, 84700, 135710, 217340, 347950, 556910, 891260, 1426210, 2282140, 3651630, 5842810]

  def get_costs
    COSTS[@level]
  end

  def get_building_time
    BUILDING_TIMES[@level]
  end

  def get_kind
    :wheat
  end
end