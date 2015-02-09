require 'selenium/server'
require 'watir-webdriver'
require 'TRLogger'
require 'TRConstants'
require 'TRExecutor'
# require 'tryouts'

include Selenium
include TR

def run_server(thread_kind)
  server = Server.new('/Users/Joe/Documents/Work/Libs/selenium-server-standalone-2.0b1.jar', background: true)
  server.start

  capabilities = WebDriver::Remote::Capabilities.htmlunit(javascript_enabled: true)
  browser = Watir::Browser.new(:firefox, :desired_capabilities => capabilities)

  TRLogger.new(browser).main(TRConstants::BASIC_URL_ATTACK)
  case thread_kind
    when :main
      TRExecutor.new(browser).main_building_thread
    when :hero
      TRExecutor.new(browser).hero_thread
  end
  server.stop
end

begin
  run_server(:hero)
rescue Exception => e
  p e
  puts e.backtrace
  raise e
end






