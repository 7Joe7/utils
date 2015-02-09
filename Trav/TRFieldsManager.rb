require 'TRConstants'
require 'TRHelper'
require 'json'

module TRFieldsManager
  include TRConstants

  def least(hash)
    least_key = :wood
    least_value = hash[:wood]
    hash.each {|k, v|
      if v.to_i < least_value
        least_key = k
        least_value = v
      end
    }
    least_key
  end

  def find_right_level_field(resource_key, level)
    @fields[resource_key].each_with_index do |field, i|
      if field[1] == level
        return i
      end
    end
  end

  def find_least_built_field(resource_key)
    least_built_index = 0
    least_built = @fields[resource_key][0]
    @fields[resource_key].each_with_index do |v, i|
      if least_built[1] > v[1]
        least_built = v
        least_built_index = i
      end
    end
    least_built_index
  end

  def robot_build_field(browser, resource_key = nil, level = nil)
    unless resource_key
      resource_key = least(get_resources(browser))
    end
    if level
      to_build_index = find_right_level_field(resource_key, level.to_i - 1)
    else
      to_build_index = find_least_built_field(resource_key)
    end
    if build_field?(@fields[resource_key][to_build_index][0], browser)
      @fields[resource_key][to_build_index][1] += 1
    end
  end

  def find_out_building_time(browser)
    enter_fields(browser)
    time_to_return = nil
    i = 0
    success = true
    while success
      i += 1
      build_time = browser.span(:id => 'timer' + i.to_s)
      if build_time.exists?
        time_parts = (build_time.text + ' ').split(':')
        new_time = time_parts[2].to_i + time_parts[1].to_i * 60 + time_parts[0].to_i * 3600
        if !time_to_return || new_time < time_to_return
          time_to_return = new_time
        end
      else
        success = false
      end
    end
    enter_barracks
    i = 0
    success = true
    while success
      i += 1
      build_time = browser.span(id: 'timer' + i.to_s)
      if build_time.exists?
        time_parts = (build_time.text + ' ').split(':')
        new_time = time_parts[2].to_i + time_parts[1].to_i * 60 + time_parts[0].to_i * 3600
        if !time_to_return || new_time < time_to_return
          time_to_return = new_time
        end
      else
        success = false
      end
    end
    time_to_return = 300 unless time_to_return
    time_to_return
  end



  def when_enough?(browsesr, desired_resources)
    actual_resources = get_resources(browser)
    grow_rates = get_growth_rates(browser)
  end

  # def build_fields_with_priority(priority)
  #   FIELDS.each {
  #
  #   }
  #   build_field()
  # end
end