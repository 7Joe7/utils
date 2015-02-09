module DataMiningHelper
  def puts_data_from_tr_table(url, browser, j = 0, k = 0)
    browser.goto(url)
    costs_all = []
    kp = []
    production = []
    something_1 = []
    something_2 = []
    times = []
    browser.tbody(index: j).trs.each_with_index do |tr, i|
      if i >= k
        costs = {}
        level = 0
        tr.tds.each_with_index do |td, i|
          case i
            when 0
              level = td.text
            when 1
              costs.merge!(wood: td.text)
            when 2
              costs.merge!(clay: td.text)
            when 3
              costs.merge!(iron: td.text)
            when 4
              costs.merge!(wheat: td.text)
            when 5
              costs.merge!(wheat_prod: td.text)
            when 6
              kp << td.text
            when 7
              production << td.text
            when 8
              something_1 << td.text
            when 9
              something_2 << td.text
            when 10
              time_parts = td.text.split(':')
              times << time_parts[0].to_i * 3600 + time_parts[1].to_i * 60 + time_parts[2].to_i
            else
          end

        end
        costs_all << costs
      end
    end

    puts costs_all[0..-3].to_s.gsub('"', '').gsub(', {', ",\n{").gsub(':wood=>', 'wood:').gsub(':clay=>', 'clay:').gsub(':iron=>', 'iron:').gsub(':wheat=>', 'wheat:').gsub(':wheat_prod=>', 'wheat_prod:').gsub(/\d /) { |match| match[/\d/] }
    puts kp[0..-2].to_s.gsub('"', '')
    puts production[0..-2].to_s.gsub('"', '').gsub(/\d /) { |match| match[/\d/] }
    puts something_1[0..-2].to_s.gsub('"', '').gsub(/\d /) { |match| match[/\d/] }
    puts something_2[0..-2].to_s.gsub('"', '').gsub(/\d /) { |match| match[/\d/] }
    puts times[0..-2].to_s.gsub('"', '').gsub(/\d /) { |match| match[/\d/] }
  end

  def float_numbers_in_structure(structure)
    puts structure.to_s.gsub(', {', ",\n{").gsub(/\d+/) { |match| match + '.0'}
  end
end