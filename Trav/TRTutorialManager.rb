require 'TRConstants'
require 'TRFieldsManager'
require 'TRVillageManager'
require 'TRGoldManager'
require 'TRReportManager'

module TRTutorialManager
  include TRConstants
  include TRFieldsManager
  include TRVillageManager
  include TRGoldManager
  include TRReportManager

  def process_tutorial
    get_next_step
  end

  def check_tutorial
    if click_if_exists?(@browser.button(class: TUTORIAL_ALARM_CLASS))
      check_tutorial
      collect_reward
    elsif @browser.div(class: BIG_SPEECH_BUBBLE).exists?
      collect_reward
      check_tutorial
    end
  end

  def get_next_step
    check_tutorial
    if @browser.ul(id: 'mentorTaskList').exists?
      tasks_list = @browser.ul(id: 'mentorTaskList')
      li_texts = []
      tasks_list.lis.each { |li| li_texts << li.text }
      li_texts.each do |li_text|
        if li_text['Woodcutter']
          robot_build_field('wood', li_text[/\d+/])
        elsif li_text['Cropland']
          robot_build_field('wheat', li_text[/\d+/])
        elsif li_text['Hero image']
          set_image
          enter_fields
        elsif li_text['Hero production']
          set_production(HERO_CLAY)
          set_production(HERO_IRON)
          set_production(HERO_WOOD)
          set_production(HERO_WHEAT)
          set_production(HERO_ALL)
          enter_fields
        elsif li_text['Enter village']
          enter_village
        elsif li_text['Construction menu']
          enter_construction_menu
        elsif li_text['Warehouse']
          if @buildings['Warehouse']
            upgrade_building('Warehouse')
          else
            set_new_building('Warehouse')
          end
        elsif li_text['Rally Point']
          enter_rally_point
          upgrade_building('Rally Point')
        elsif li_text['Complete construction']
          complete_construction_immediately
        elsif li_text['Hero adventure']
          enter_village
          send_for_adventure
        elsif li_text['Report menu']
          open_reports
        elsif li_text['Read report']
          read_reports
        elsif li_text['Hero inventory']
          enter_inventory
        elsif li_text['Heal hero']
          @browser.divs(class: 'elementTitle').each do |div|
            if div.text['Ointment']
              if div.parent.parent.parent.parent.style['top: 684px; left: 706px']
                @browser.div(id: 'inventory_1')
              end
            end
          end
        elsif li_text['User Interface Help']
          enter_village
          @browser.button(class: 'bulbWhite').click
          @browser.link(class: 'overlayCloseLink').click
        elsif li_text['End of tutorial']
          @browser.button(class: 'questButtonNext').click
        elsif li_text['Next adventure']
          send_for_adventure
        elsif li_text['Construct a cranny']
          set_new_building('Cranny')
        elsif li_text['Iron mine']
          robot_build_field('iron')
        elsif li_text['More resources']
          robot_build_field
        elsif li_text['View statistics']
          enter_statistics
        elsif li_text['Change village name']
          edit_village_name
        end
      end
      get_next_step
    end
  end

  def not_enough_room
    given_resources = {}
    resource_values = []
    if @browser.div(class: 'questRewards')
      @browser.div(class: 'questRewards').spans.each do |span|
        resource_values << span.text.to_i
      end
      if @browser.img(class: 'questRewardTypeWood').exists?
        given_resources.merge!(wood: resource_values[0])
      end
      if @browser.img(class: 'questRewardTypeClay').exists?
        given_resources.merge!(wood: resource_values[1])
      end
      if @browser.img(class: 'questRewardTypeIron').exists?
        given_resources.merge!(wood: resource_values[2])
      end
      if @browser.img(class: 'questRewardTypeCrop').exists?
        given_resources.merge!(wood: resource_values[3])
      end
    end
    resource_limits = get_resource_limits
    actual_resources = get_resources
    actual_resources.each do |resource_key, resource_value|
      if given_resources[resource_key]
        if given_resources[resource_key] > resource_limits[resource_key] - resource_value
          return true
        end
      end
    end
    false
  end

  def get_resource_limits
    warehouse = @browser.span(id: 'stockBarWarehouse').text.to_i
    {
      wood: warehouse,
      clay: warehouse,
      iron: warehouse,
      wheat: @browser.span(id: 'stockBarGranary').text.to_i,
    }
  end

  def collect_reward
    click_if_exists?(@browser.button(id: QUEST_MASTER_ID))
    if @browser.button(value: COLLECT_REWARD_BUTTON_VALUE).exists?
      @browser.button(value: COLLECT_REWARD_BUTTON_VALUE).click
      get_next_step
    else
      enter_village
      reward_image = @browser.img(class: 'reward')
      if reward_image
        if click_if_exists?(reward_image.parent)
          if @browser.button(value: COLLECT_REWARD_BUTTON_VALUE).exists?
            if not_enough_room
              if @buildings['Warehouse']
                upgrade_building('Warehouse')
                sleep find_out_building_time
              else
                set_new_building('Warehouse')
              end
              if @buildings['Granary']
                upgrade_building('Granary')
              else
                set_new_building('Granary')
              end
            else
              @browser.button(value: COLLECT_REWARD_BUTTON_VALUE).click
              get_next_step
            end
          end
        end
      end
    end
  end
end