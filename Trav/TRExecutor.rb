require 'TR'
require 'json'
require 'TRDecisionMaker'
require 'fields/TRField'
require 'buildings/TRBuilding'
require 'villages/TRVillage'
require 'TRHero'

class TRExecutor

  def initialize(browser)
    @browser = browser
  end

  def main_building_thread
    options = []
    options.concat(TRField.find_fields(@browser))
    # options + TRBuilding.find_buildings(@browser)
    @dm = TRDecisionMaker.new(TRVillage.get_growth_rates(@browser), TRVillage.get_resources(@browser), TRVillage.get_free_crop_balance(@browser))
    @dm.define_goal({wood: 700.0, clay: 700.0, iron: 500.0, wheat: 550.0})
    options.each { |option| @dm.add_option(option) }
    while true
      decision = @dm.decide
      puts decision
      if decision.execute?
        sleep(decision.building_times[:main] * 3600.0)
        @dm.update_state(decision)
      else
        sleep(@dm.wait_till_affordable(decision))
      end
    end
  end

  def hero_thread
    while true
      hero = TRHero.new(@browser)
      hero.upgrade(@browser, {production: 3, strength: 1}) if hero.level_up?(@browser)
      TRHero.open_main(@browser)
      if hero.send_for_adventure(@browser)
        sleep(hero.moving_time)
        hero.upgrade(@browser, {production: 3, strength: 1}) if hero.level_up?(@browser)
        sleep(hero.moving_time)
      else
        sleep(300)
      end
    end
  end
    # @browser.send_keys(:command, 't')


    # process_tutorial
    # priorities = []
    # # enhance_farm_list
    # while true
    #   build_priorities(priorities)
    #   order_twenty
    #   robot_build_soldiers
    #   robot_build_field
    #   robot_send_troops
    #   send_for_adventure
    #   sleep(find_out_building_time)
    #   enter_fields
    # end
end