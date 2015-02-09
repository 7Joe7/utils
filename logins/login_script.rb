require 'uri'
require 'open-uri'
require 'net/http'
require "selenium-webdriver"

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

  def initialize
    browser = Selenium::WebDriver.for :firefox
  end

  def main
    url = CONFIG[:url] + construct_action(CONFIG[:jsessionid], CONFIG[:sess_free], CONFIG[:ref], CONFIG[:action])
    uri = URI.parse(url)
    # params = { :jsessionid => CONFIG[:jsessionid], :SessFree => CONFIG[:sess_free], ref: CONFIG[:ref], action: CONFIG[:action] }

    # Add params to URI
    # uri.query = URI.encode_www_form( params )

    puts uri.open.read
    puts '-------------------------------------------------------------------------------------'
    # puts Net::HTTP.get(uri)
    # url = CONFIG[:url] + construct_action(CONFIG[:jsessionid], CONFIG[:sess_free], CONFIG[:ref], CONFIG[:action])
    `open #{uri}`
  end

  def construct_action(jsessionid, sess_free, ref, action)
    CONFIG[:basic_addition].gsub('jsessionid=', "jsessionid=#{jsessionid}").gsub('SessFree=', "SessFree=#{sess_free}").gsub('ref=', "ref=#{ref}").gsub('action=', "action=#{action}")
  end
end

P4U::Logger.new.main


