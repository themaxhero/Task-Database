#============================================================================================================================================================================================================
# Main by: maxhero (Marcelo Amancio de Lima Santos)
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Duh?
#============================================================================================================================================================================================================
require './src/struct'
require './src/func'
require './src/parser'
$intro = [
					"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
					"@ This Software was developed by maxhero A.K.A Marcelo Amancio de Lima Santos",
					"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
]
$intro.each{|text|puts text}
loop do
	puts "Type some command:"
	print "$>"
	command = gets.chomp();
	Parse(command);
end