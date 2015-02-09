require 'TR'
require 'TRConstants'
require 'TRFarms'

module TRWarManager
  include TRConstants
  include TRFarms

  def enter_barracks
    enter_village
    @browser.area(href: B_BARRACKS).click
  end

  def robot_build_soldiers
    enter_barracks
    @browser.text_field(name: 't1').set 1
    # @browser.link(:href => '#', :index => 1).click
    @browser.button(class: 'green startTraining').click
  end

  def order_twenty
    enter_barracks
    @browser.link(onchange: "$(this).getParent('div.details').getElement('input').value=0; return false;").click
    if (@browser.text_field(name: 't1').value + ' ').to_i >= 20
      @browser.button(class: 'green startTraining').click
    end
  end

  def get_number_of_troops
    enter_fields
    troops = {}
    success = true
    i = 0
    while success
      troop_name_holder = @browser.td(class: 'un', index: i)
      if troop_name_holder.exists?
        case troop_name_holder.text
          when 'Clubswingers'
            troops.merge!({:c => (@browser.td(class: 'num', index: i + 4).text + " ").to_i})
          when 'Hero'
            troops.merge!({:h => (@browser.td(class: 'num', index: i + 4).text + " ").to_i})
        end
      else
        success = false
      end
      i += 1
    end
    troops
  end

  def robot_send_troops

    troops = get_number_of_troops
    if troops[:c] && troops[:c] >= 21 && troops[:h]
      @browser.goto(BASIC_URL + "position_details.php?x=#{@farms[:o_i_c][0]}&y=#{@farms[:o_i_c][1]}")
      @browser.link(class: 'a arrow', index: 1).click
      @browser.text_field(name: 't1').set 21
      @browser.text_field(name: 't11').set 1
      @browser.button(id: 'btn_ok').click
      @browser.button(id: 'btn_ok').click
    end
  end

  def enhance_farm_list
    x = MY_X
    y = MY_Y
    (x-1) .. (x+1).each {|x|
      (y-1) .. (y+1).each {|y|
        @browser.goto(BASIC_URL + "position_details.php?x=#{x}&y=#{y}")
        heading = (@browser.h1(class: 'textWithCoords').text + ' ').strip
        case heading
          when /Abandoned valley/
          when /Unoccupied oasis/
            bonus_value = (@browser.td(class: 'val').text + ' ').strip
            case bonus_value
              when '25‬%'
                big = false
              when '50%'
             end
            bonus_kind = (@browser.td(:class => 'desc').text + ' ').strip
            case


            end
            @farms.merge()
          else
        end
      }
    }
  end

  def enter_gathering
    enter_village
    @browser.area(href: B_GATHERING).click
  end
end