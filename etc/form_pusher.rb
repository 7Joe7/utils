require 'selenium/server'
require 'watir-webdriver'
# require 'TRManager'
# require 'TRLogger'
# require 'TRConstants'
# require 'TRExecutor'

include Selenium

def check_no_date?(browser)
  if browser.span(id: 'cphMain_lblNoDates').exists?
    if browser.span(id: 'cphMain_lblNoDates').text['We are sorry, no appointments are currently available. Please try it again in a few days.']
      check_free_dates(browser)
    else
      return true
    end
  else
    true
  end
end

def check_free_dates(browser)
  @counter += 1
  if @counter % 200 == 0
    system('say "still running"')
  end
  if browser.input(id: 'ctl00_cphMain_btnNext_input').exists?
    browser.input(id: 'ctl00_cphMain_btnNext_input').click
  end
  return true if check_no_date?(browser)
rescue Timeout::Error
  retry
rescue Errno::ECONNREFUSED
  retry
rescue Exception => e
  p e
  puts e.backtrace
  return true
end

begin
  server = Server.new('/Users/Joe/Documents/Work/Libs/selenium-server-standalone-2.0b1.jar', background: true)
  server.start

  capabilities = WebDriver::Remote::Capabilities.htmlunit(javascript_enabled: true)
  browser = Watir::Browser.new(:safari, desired_capabilities: capabilities)

  browser.goto('https://visapoint.eu/form')

  sleep 45

  @counter = 0

  until check_free_dates(browser)
  end
  system('say "free date"')
end







