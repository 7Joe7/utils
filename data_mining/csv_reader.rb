require 'csv'

begin
  CSV.parse('/Users/Joe/Documents/Work/Utils/data_mining/Vanoce_2014_Nepalova.csv') do |line|
    print line
  end
end