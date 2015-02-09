require './socket_helper.rb'

include SocketHelper

LOCAL_PORT = 1616

puts(is_port_open?('localhost', LOCAL_PORT) ?
         "The port #{LOCAL_PORT} is not available." :
         "The port #{LOCAL_PORT} is available.")