require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/fields/TRClayField.rb'
require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/fields/TRIronField.rb'
require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/fields/TRWheatField.rb'
require '/Users/Joe/Documents/Work/Unicorn/Utils/Trav/fields/TRWoodField.rb'

class TRFieldsFactory

  def self.create_field(kind, level, href)
    case kind
      when :wood
        field = TRWoodField.new(level, href)
      when :clay
        field = TRClayField.new(level, href)
      when :iron
        field = TRIronField.new(level, href)
      when :wheat
        field = TRWheatField.new(level, href)
    end
    field
  end
end