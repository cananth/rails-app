require 'socket'
server = TCPServer.new('172.17.0.2', 2002)
while (session = server.accept)
	file = File.open("list_of_programs.html", "r")
	content = file.read
  puts "Request: #{session.gets}"
  session.print "HTTP/1.1 200/OK\r\nContent-type: text\r\n\r\n"
  session.print content +  "\r\n"
  session.close
end
