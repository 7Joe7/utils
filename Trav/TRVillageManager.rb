require 'TRConstants'
require 'TRHelper'

module TRVillageManager
  include TRConstants

  def build_priorities(priorities, browser)
    priorities.each do |v|
      if upgrade_building(v, browser)
        priorities.delete_at(0)
      end
    end
  end

  def enter_construction_menu(browser)
    enter_village(browser)
    href = nil
    if browser.area(alt: 'Building site').exists?
      bs = browser.area(alt: 'Building site')
      href = bs.href.to_s.dup
      bs.click
    end
    href
  end

  def set_new_building(building, browser)
    href = enter_construction_menu(browser)
    unless browser.span(class: 'none').text == 'The workers are already at work.'
      browser.divs(class: 'buildingWrapper').each do |div|
        if div.h2(text: building.capitalize).exists?
          building_heading = div.h2(text: building.capitalize)
          building_heading.parent.div(class: 'contractWrapper').div(class: 'contractLink').button.click
          @buildings[building] = href
          break
        end
      end
    end
  end

  def upgrade?(place, browser)
    enter_village(browser)
    browser.area(href: place).click
    success = click_if_exists?(browser.button(class: BUILD_BUTTON_CLASS))
    unless success
      success = click_if_exists?(browser.button(class: BUILD_NEW_BUTTON_CLASS))
    end
    success
  end

  def upgrade_building(building, browser)
    enter_village(browser)
    browser.area(href: @buildings[building]).click
    success = click_if_exists?(browser.button(class: BUILD_BUTTON_CLASS))
    unless success
      success = click_if_exists?(browser.button(class: BUILD_NEW_BUTTON_CLASS))
    end
    success
  end
end

