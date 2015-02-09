require 'TR'

module TRGoldManager
  include TRConstants

  def complete_construction_immediately
    enter_village
    click_if_exists?(@browser.button(value: COMPLETE_CONSTRUCTION_IMMEDIATELY_VALUE))
    click_if_exists?(@browser.button(value: REDEEM_VALUE))
  end
end