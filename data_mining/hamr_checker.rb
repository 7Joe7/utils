require 'selenium/server'
require 'watir-webdriver'
require 'net/smtp'

SEND_TO_NAME = 'Josef Erneker'
SEND_TO_ADDRESS = 'josef.erneker@gmail.com'

MESSAGE = <<MESSAGE_END
From: Hamr Checker <hamr_checker@tajc.com>
To: #{SEND_TO_NAME} <#{SEND_TO_ADDRESS}>
Subject: Hamr Checker found place

Hamr Checker found a free place for you. From %s to %s.
MESSAGE_END

def add_one_to_time(time)
  time_array = time.split(':')
  if time_array.last.to_i == 30
    hour = 1
    result = ':00'
  else
    hour = 0
    result = ':30'
  end
  if time_array.first.to_i + hour > 22
    raise Exception.new('Your demanded time range goes over night.')
  else
    result = (time_array.first.to_i + hour).to_s + result
  end
  result
end

def count_id(time, day = nil, month = nil, year = nil)
  now = Time.now
  desired_time = Time.new(year || now.year, month || now.month, day || now.day, 0, 0, 0)
  now_time = Time.new(now.year, now.month, now.day, 0, 0, 0)
  day_id = (desired_time - now_time) / 86400
  time_array = time.split(':')
  time_id = (time_array.first.to_i - 7) * 2
  time_id += 1 if time_array.last.to_i == 30
  "rgI_#{day_id.to_i}_#{time_id}"
end

def check_in(browser, id)

end

# @param [Selenium::Server] browser
# @param [String] id
def is_free?(browser, id)
  browser.div(xpath: "//div[(contains(@class, 'rgs-free') or contains(@class, 'rgs-free-has') or contains(@class, 'rgs-none-has')) and parent::td[@id='#{id}']]").exists?
end

def login(browser)
  browser.input(id: 'ctl00_toolboxRight_btLogin').click
end

def start_browser
  server = Selenium::Server.new('/Users/Joe/Documents/Work/Libs/selenium-server-standalone-2.0b1.jar', background: true)
  server.start

  capabilities = Selenium::WebDriver::Remote::Capabilities.htmlunit(javascript_enabled: true)
  Watir::Browser.new(:safari, desired_capabilities: capabilities)
end

def send_mail
  Net::SMTP.start('smtp.seznam.cz', 25, 'seznam', 'xerne@seznam.cz', 'ernicek', 'plain') do |smtp|
    smtp.send_message(MESSAGE, 'xerne@seznam.cz', SEND_TO_ADDRESS)
  end
end

def hamr_check_in(browser, time_beginning, half_hours, min_half_hours, day = nil, month = nil, year = nil, email_sent = false)
  free_ids, range, next_time, free_times = [], 0, time_beginning, []
  (1..half_hours).each do
    id = count_id(next_time, day, month, year)
    if is_free?(browser, id)
      puts "#{next_time} is free."
      free_times << next_time
      free_ids << id
      range += 1
    else
      free_times = []
      free_ids = []
      range = 0
    end
    if range == min_half_hours
      system('say "free place"')
      send_mail unless email_sent
      email_sent = true
      break
    end
    next_time = add_one_to_time(next_time)
  end
  email_sent
end

begin
  browser = start_browser
  browser.goto('http://hodiny.hamrsport.cz/Login.aspx')
  login(browser)
  email_sent = false
  loop do
    email_sent = hamr_check_in(browser, '19:00', 4, 2, 28, nil, nil, email_sent)
    browser.refresh
  end
end