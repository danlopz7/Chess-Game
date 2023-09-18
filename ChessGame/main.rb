require './chess'

# this is the entry point for the current project

help = ARGV.find { |e| help = true if e == '--help' }
if help
  puts 'Game was intended to accept two inputs like \'B1 B2\' to move the corresponding piece to a certain location. Couldnt finish but applied Solid principles like single responsibility and open close principle. Also im uploading my domain model that represents the conception of this project.' 
else
  t = ChessGame.new
end