require 'bundler'
require 'watir-webdriver'
require 'watir'

module P4U

end

class P4U::Logger

  CONFIG = {
      url: 'https://plus4u.net/',
      url2: 'https://plus4u.net/ues/sesm',
      ac1: 'mandelina',
      ac2: 'mandelina7',
      basic_addition: 'ues/sesm;jsessionid=&SessFree=&ref=&action=&',
      jsessionid: '20ED0DEE317A399197CF8F0B47FA759E.0tcde22?REQID=y96gAnYg-X8=&WINID=e1',
      sess_free: 'ues%3ADEV0105-BT%5B84723967990066693%5D%3A34339947196127081%5B34339947196127081%5D%3A%3FRELATED_CONTRACT',
      ref: 'ues%3ADEV0105-BT%5B84723967990066693%5D%3A34339947196127081%5B34339947196127081%5D%3A41376821613922394%5B41376821613922394%5D',
      action: 'ues%253ADEV0105-BT%255B84723967990066693%255D%253A34339947196127081%255B34339947196127081%255D%253A%253FRELATED_CONTRACT',
  }

  ELMS = {
      ac1: 'UES_AccessCode1',
      ac2: 'UES_AccessCode2',
      submit_link: 'UULinkSubmit',
  }

  def initialize
    profile = Selenium::WebDriver::Firefox::Profile.new
    # @profile = Selenium::WebDriver::Firefox::Profile.from_name('default')
    # profile.add_extension "../path/to/firebug.xpi"
    profile.proxy = Selenium::WebDriver::Proxy.new :http => '127.0.0.1:9090', :ssl => '127.0.0.1:9090'
    # browser = Watir::Browser.new :chrome, :profile => profile
    # @browser = Watir::Browser.attach :firefox, profile: profile
    @browser = Watir::IE.attach(title: 't1')
  end

  def main
    # @browser.goto(CONFIG[:url] + construct_action(CONFIG[:jsessionid], CONFIG[:sess_free], CONFIG[:ref], CONFIG[:action]))
    # @browser.link(:xpath, '//a[@id="UULinkSubmit"]').click
    # ac1_input = @browser.input(id: ELMS[:ac1])
    # ac2_input = @browser.input(id: ELMS[:ac2])
    # submit_link = @browser.link(id: ELMS[:submit_link])
    # p ac1_input
    # p ac2_input
    # p submit_link
    # if ac1_input.exists? && ac2_input.exists? # && submit_link.exists?
    #   ac1_input.text = CONFIG[:ac1]
    #   ac2_input.text = CONFIG[:ac2]
    #   puts 'Logged'
    # else
    #   puts 'Login unsuccessful'
    # end
  end

  def construct_action(jsessionid, sess_free, ref, action)
    CONFIG[:basic_addition].gsub('jsessionid=', "jsessionid=#{jsessionid}").gsub('SessFree=', "SessFree=#{sess_free}").gsub('ref=', "ref=#{ref}").gsub('action=', "action=#{action}")
  end
end

P4U::Logger.new.main
