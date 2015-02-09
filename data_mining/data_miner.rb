require 'watir-webdriver'

class DataMiner

  def initialize(data)
    @data = data
    @browser = Watir::Browser.start(@data[:address], :firefox)
    login
  end

  def input_parameter(key)
    @browser.input(id: @data["#{key}_id".to_sym]).to_subtype.set @data[key]
  end

  def click_button(key)
    @browser.input(id: key.to_s).click
  end

  def login
    input_parameter(:username)
    input_parameter(:password)
    click_button(:submit)
  end

  def quit
    @browser.close
  end
end