require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/TRConstants.rb'

class TRVillage
  include TRConstants

  def self.enter_fields(browser)
    browser.link(href: FIELDS_HREF).click
  end

  def self.get_growth_rates(browser)
    enter_fields(browser)
    {
        wood: browser.td(class: 'num', index: 0).text.gsub(',', '')[/\d+/].to_i,
        clay: browser.td(class: 'num', index: 1).text.gsub(',', '')[/\d+/].to_i,
        iron: browser.td(class: 'num', index: 2).text.gsub(',', '')[/\d+/].to_i,
        wheat: browser.td(class: 'num', index: 3).text.gsub(',', '')[/\d+/].to_i
    }
  end

  def self.get_free_crop_balance(browser)
    (browser.span(id: 'stockBarFreeCrop').text.gsub(',', '') + ' ').to_i
  end

  def self.get_resources(browser)
    {
        wood: (browser.span(id: R_INFO_WOOD).text.gsub(',', '') + ' ').to_i,
        clay: (browser.span(id: R_INFO_CLAY).text.gsub(',', '') + ' ').to_i,
        iron: (browser.span(id: R_INFO_IRON).text.gsub(',', '') + ' ').to_i,
        wheat: (browser.span(id: R_INFO_WHEAT).text.gsub(',', '') + ' ').to_i
    }
  end

  def self.enter_village(browser)
    @browser.link(href: VILLAGE_HREF).click
  end

  def self.enter_statistics(browser)
    browser.link(href: 'statistiken.php').click
  end

  def self.edit_village_name(browser)
    TRVillage.enter_village(browser)
    browser.button(class: 'editWhite').click
  end
end