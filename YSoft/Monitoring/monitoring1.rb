require './socket_helper.rb'

include SocketHelper

FIRST_IP = '128.0.0.2'

puts(is_port_open?(FIRST_IP, 'echo') ?
         "The IP address #{FIRST_IP} is reachable." :
         "The IP address #{FIRST_IP} is not reachable.")