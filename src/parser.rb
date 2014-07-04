#============================================================================================================================================================================================================
# Option Parser by: maxhero (Marcelo Amancio de Lima Santos)
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Duh?
#============================================================================================================================================================================================================
=begin
	when //i
=end
def Parse(string)
	case string
	when /Create Task (\w+) (\w+) (\w+)/i
		CreateNewTask($1,$2,$3);
		puts "Created new task: #{$1}"
	when /Save (\w+)/i
		SaveDatabase($1);
		puts "Saved Database: #{$1}.db"
	when /Load (\w+)/i
		LoadDatabase($1);
		puts "Loaded Database: #{$1}.db"
	when /Show Tasks From: (\w+) (\w+)/i
		case $1
		when /Priority/i
			ShowAllFromPriority($2);
		when /Type/i
			ShowAllFromType($2);
		end
	when /Show All Tasks/i
		ShowAllTasks();
	when /Show All Types/i
		ShowAllTypes();
	when /Show All Priorities/i
		ShowAllProprieties();
	when /exit/i
		Quit();
	when /help/i
		ShowHelp();
	when /raffle/i
		Tasks.raffle
	when /raffle (\w+) (\w+)/i
		Tasks.raffle($1,$2)
	when /clear/i
		system('cls')
		$intro.each{|text|puts text}
	when /Delete Task (\w+)/i
		x = Tasks.data.collect{|value| value if value.name == $1}
		x.each{|item|Tasks.data.delete(item)}
	end
end