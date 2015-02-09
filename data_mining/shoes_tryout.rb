Shoes.app do
  @button = button "Click Me"

  @button.click do
    browser = start_browser
    browser.goto('http://hodiny.hamrsport.cz/Login.aspx')
    login(browser)
    loop { hamr_check_in(browser, '19:00', 4, 2, 28) }
  end

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
    system('say "free place"')
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
    server = Server.new('/Users/Joe/Documents/Work/Libs/selenium-server-standalone-2.0b1.jar', background: true)
    server.start

    capabilities = WebDriver::Remote::Capabilities.htmlunit(javascript_enabled: true)
    Watir::Browser.new(:safari, desired_capabilities: capabilities)
  end

  def hamr_check_in(browser, time_beginning, half_hours, min_half_hours, day = nil, month = nil, year = nil)
    free_ids, range, next_time = [], 0, time_beginning
    (1..half_hours).each do
      id = count_id(next_time, day, month, year)
      if is_free?(browser, id)
        free_ids << id
        range += 1
      else
        free_ids = []
        range = 0
      end
      if range == min_half_hours
        free_ids.each do |free_id|
          check_in(browser, free_id)
          puts free_id
        end
        break
      end
      next_time = add_one_to_time(next_time)
    end
  end

  begin
    browser = start_browser
    browser.goto('http://hodiny.hamrsport.cz/Login.aspx')
    login(browser)
    loop { hamr_check_in(browser, '19:00', 4, 2, 28) }
  end
end