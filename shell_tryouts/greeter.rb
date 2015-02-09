#!/usr/bin/env ruby

require 'JoeUtils'

# Task description:
#
# Localisation of Java products is based on .properties files. Files contains key = value.
#  E.g.: singer=Johy Cash  Where "singer" is key and "Johny Cash" is value.
# Translators often need to know how many words are in the file.  
# Simple count words just does not work, because it also contains amount of keys.
# Create tool/script which performs following scenario:
# 1.     extract localisation.zip
# 2.     process files and remove key =; only words from translation remain   E.g.: singer=Johny Cash -> Johny Cash
# 3.     count number of words in transformed files and create report file
#     which contains list of files and number of words in format:  file1.properties - 123  file2.properties - 212
# 4.     pack transformed files and report file into export.zip file
# You can choose technology for this tool. Do not forget to create at least simple documentation.

# TODO
# 1)
#   a) read address from console
#   b) if none given, check the actual location
#   c) if nothing there, check the location of folder locations in the actual directory
#   d) if nothing found let the user know what he needs to provide
# 2)
#   unzip the file localisation.zip to folder in actual location
# 3)
#   loop the reading and processing of the extracted files:
#     read, pattern match, remove, count, create list item for the report file, save it in a general variable,
#     save transformed file into a new folder
# 4)
#   create the report file with content of the general variable, save it next to transformed files
# 5)
#   pack the transformed files with the report
# 6)
#   create documentation with guideline how to run this script

include FilesHelper

ZIP_NAME = 'localisation.zip'
KEY_EQUALS_REGEXP = /[^\n]([ \t]*\w+[ \t]*)*=/
FILES_MATCHING = '*.properties'
EXIT_CMD = 'exit'
CONSOLE_MESSAGE = "Insert the address of the #{ZIP_NAME} file or insert 'exit' to finish:"
REPORT_FILE_NAME = 'report.txt'
RESULT_FILE = './export.zip'

path = ARGV[0]
path = './' unless path && !path.empty?
path += ZIP_NAME unless path[ZIP_NAME]

until file_exists?(path) do
  puts CONSOLE_MESSAGE
  path = gets.downcase.chomp
  exit if path == EXIT_CMD
  path = File.join(path, ZIP_NAME) unless path[ZIP_NAME]
end

path_dir = File.dirname(path)
unzip_location = File.join(path_dir, ZIP_NAME[0..-5])
create_dir(unzip_location, overwrite: true)
unzip(path, unzip_location)
report_text = ''
for_all_in_dir(unzip_location, matching: FILES_MATCHING, recursive: true) do |f|
  edit_file(f) do |content|
    new_content = content.gsub(KEY_EQUALS_REGEXP, "\n")
    number_of_words = new_content.split.size
    report_text += "#{f} - #{number_of_words}\n"
    new_content
  end
end # TODO takes too long
report_file = File.join(unzip_location, REPORT_FILE_NAME)
create_file(report_file, report_text)
zip_folder(RESULT_FILE, path_dir, matching: FILES_MATCHING) # TODO Uncaught exception: wrong number of arguments calling `add` (1 for 2)

add_to_zip(RESULT_FILE, report_file)
remove_dir(unzip_location)





