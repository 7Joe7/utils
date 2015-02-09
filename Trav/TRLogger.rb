require 'bundler'
require 'watir-webdriver'
require 'TR'
require 'TRConstants'

class TR::TRLogger



  CONFIG = {
      password: 'mandelina',
      username: '_Joe_'
  }

  ELMS = {
      username: 'name',
      password: 'password',
      login_button: 's1',
  }

  def initialize(browser)
    @browser = browser
  end

  def main(url)
    @browser.goto(url)
    @browser.text_field(name: ELMS[:username]).set CONFIG[:username]
    @browser.text_field(name: ELMS[:password]).set CONFIG[:password]
    @browser.button(id: ELMS[:login_button]).click
    @browser
  end

end