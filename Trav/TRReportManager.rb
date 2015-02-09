require 'TR'

module TRReportManager
  include TRConstants

  def open_reports
    click_if_exists?(@browser.link(href: REPORTS_HREF))
  end

  def read_reports
    open_reports
    @browser.tds(class: 'newMessage').each do |new_message|
      if click_if_exists?(new_message.div.link(class: 'adventure'))
        time = @browser.div(class: 'header text').text
        experience = nil; health = nil
        @browser.td(class: 'dropItems').texts.each_with_index do |text, i|
          if i == 0
            experience = text
          elsif i == 1
            health = text
          end
        end
        if @browser.img(class: 'silver').exists?
          kind = 'silver'
        end
        amount = @browser.td(colspan: '11').text
        @adventures.merge!("Adventure #{@adventures.size}" => [time, experience, health, kind, amount] )
        break
      elsif click_if_exists?(new_message.div.link(class: '')) # TODO
        break
      end
    end
  end
end