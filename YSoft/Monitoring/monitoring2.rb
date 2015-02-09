require './socket_helper.rb'

include SocketHelper

YSOFT_ADDRESS = 'www.ysoft.com'
YSOFT_PORT = 80

puts(is_port_open?(YSOFT_ADDRESS, YSOFT_PORT) ?
         "The port #{YSOFT_PORT} on address #{YSOFT_ADDRESS} is responding." :
         "The port #{YSOFT_PORT} on address #{YSOFT_ADDRESS} is not responding.")