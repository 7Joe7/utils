require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/TRConstants.rb'
require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/TROption.rb'
require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/fields/TRFieldsFactory.rb'
require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/villages/TRVillage.rb'
require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/TRHelper.rb'

class TRField
  include TRConstants

  GROWTH_RATES = [5.0, 9.0, 15.0, 22.0, 33.0, 50.0, 70.0, 100.0, 145.0, 200.0, 280.0, 375.0, 495.0, 635.0, 800.0, 1000.0, 1300.0, 1600.0, 2000.0, 2450.0, 3050.0, 3750.0, 4600.0, 5650.0, 6950.0]
  CULTURE_POINTS = [1, 1, 2, 2, 2, 3, 4, 4, 5, 6, 7, 9, 11, 13, 15, 18, 22, 27, 32, 38, 46, 55, 66, 79, 95]

  attr_reader :level, :href

  def initialize(level, href)
    @level = level.to_i
    @href = href
  end

  def build(browser)
    if TRField.build_field?(@href, browser)
      @level += 1
      return true
    end
    false
  end

  def to_s
    get_kind.to_s + ' ' + @level.to_s
  end

  def get_growth_rate
    GROWTH_RATES[@level]
  end

  def get_growth_rate_difference
    GROWTH_RATES[@level + 1] - GROWTH_RATES[@level]
  end

  def get_next_growth_rate
    GROWTH_RATES[@level + 1]
  end

  def get_culture_points
    CULTURE_POINTS[@level]
  end

  def get_next_culture_points
    CULTURE_POINTS[@level + 1]
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

  def self.find_fields(browser)
    options = []
    FIELDS.each { |k, v|
      v.each { |href|
        TRVillage.enter_fields(browser)
        browser.area(href: href[0]).click
        field = TRFieldsFactory.create_field(k, browser.div(class: 'contractText').text[/\d+/].to_i - 1, href[0])
        growth_boost = EMPTY_PRODUCTION_BOOST.merge(field.get_kind => field.get_growth_rate_difference)
        growth_boost[:wheat] = growth_boost[:wheat] - field.get_costs[:wheat_prod]
        options << TROption.new(field, field.get_costs, {main: field.get_building_time / 3600.0}, growth_boost, browser)
      }
    }
    options
  end

  def self.build_field?(place, browser)
    TRVillage.enter_fields(browser)
    browser.area(href: place).click
    TRHelper.click_if_exists?(browser.button(class: BUILD_BUTTON_CLASS))
  end
end