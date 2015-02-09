require 'TRHelper'
require 'TRConstants'

class TRHero
  include TRConstants

  attr_reader :level, :production, :abilities, :moving_time

  def initialize(browser)
    @level = TRHero.find_level(browser)
    @production = TRHero.find_production_type(browser)
    @abilities = nil
  end

  def self.find_level(browser)
    TRHero.open_main(browser)
    @level = browser.h1(class: 'titleInHeader').text[/\d+/]
  end

  def self.find_production_type(browser)
    TRHero.open_main(browser)
    if browser.input(id: 'resourceHero0').attribute_value('checked') == 'checked'
      @production = :all
    elsif browser.input(id: 'resourceHero1').attribute_value('checked') == 'checked'
      @production = :wood
    elsif browser.input(id: 'resourceHero2').attribute_value('checked') == 'checked'
      @production = :clay
    elsif browser.input(id: 'resourceHero3').attribute_value('checked') == 'checked'
      @production = :iron
    elsif browser.input(id: 'resourceHero4').attribute_value('checked') == 'checked'
      @production = :wheat
    end
  end

  def send_for_adventure(browser)
    success = false
    browser.button(class: HERO_ADVENTURE_BUTTON_CLASS).click
    time_parts = browser.td(class: 'moveTime').text.split(':')
    @moving_time = Float(time_parts[0].to_i * 3600 + time_parts[1].to_i * 60 + time_parts[2].to_i)
    if TRHelper.click_if_exists?(browser.link(class: GO_TO_ADVENTURE_CLASS))
      success = TRHelper.click_if_exists?(browser.button(id: GO_FOR_ADVENTURE_BUTTON_ID))
    end
    success
  end

  def self.open_main(browser)
    TRHelper.click_if_exists?(browser.button(id: HERO_IMAGE_BUTTON_ID))
  end

  def level_up?(browser)
    browser.div(class: 'levelUp').exists?
  end

  def upgrade(browser, values)
    TRHero.open_main(browser)
    values.each do |key, value|
      case key
        when :production
          value.times { browser.td(class: 'add', index: 3).links.first.click }
        when :strength
          value.times { browser.td(class: 'add', index: 0).links.first.click }
      end
    end
    TRHelper.click_if_exists?(browser.button(id: 'saveHeroAttributes'))
  end

  def set_production?(browser, production_type)
    success = false
    if TRHelper.click_if_exists?(browser.button(id: HERO_IMAGE_BUTTON_ID))
      browser.radio(id: production_type).set
      if TRHelper.click_if_exists?(browser.button(id: SAVE_HERO_ATTRIBUTES_BUTTON_ID))
        @production = production_type
        success = true
      end
    end
    success
  end

  def set_image(browser)
    browser.button(id: HERO_IMAGE_BUTTON_ID).click
    browser.link(text: 'Appearance').click
  end

  def self.enter_inventory(browser)
    browser.button(id: HERO_IMAGE_BUTTON_ID).click
  end
end