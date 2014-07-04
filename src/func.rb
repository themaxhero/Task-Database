#============================================================================================================================================================================================================
# Functions by: maxhero (Marcelo Amancio de Lima Santos)
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 
#============================================================================================================================================================================================================
def CreateNewTask(name,type,priority)
	Tasks.data << Tasks::Task.new(name,type,priority)
end
def GetAllFromType(type)
	return Tasks.data.collect{|item| item if item.type == type}
end
def ShowAllFromType(type)
	puts GetAllFromType(type)
end
def GetAllFromPriority(priority)
	return Tasks.data.collect{|item| item if item.priority == priority}
end
def ShowAllFromPriority(priority)
	puts GetAllFromPriority(priority)
end
def ShowHelp()
	help_text = [
	"'Create Task', Syntax: 'Create Task x y z'\n	x - The Task's name\n	y - Task's Type\n	z - Task's Priority",
	"'Save', Syntax: 'Save x'\n	x - File's name(without extension)",
	"'Load', Syntax: 'Load x'\n	x - File's name(without extension)",
	"'Show Tasks From', Syntax: 'Show Tasks From x y'\n	x - Inquiry\n	y - Value",
	"'Show All Tasks', Syntax: 'Show All Tasks'",
	"'Show All Types', Syntax: 'Show All Types'",
	"'Show All Priorities', Syntax: 'Show All Priorities'",
	"'Exit', Syntax: 'Exit'",
	"'Help', Syntax: 'Help'",
	"'Raffle', Syntax: 'Raffle' or 'Raffle x y",
	"'Clear', Syntax: 'Clear'",
	"'Delete', Syntax: 'Delete x'\n	x - Task's name"
	]
	help_text.each{|text| puts text}
end
def SaveDatabase(filename)
	file = File.open(filename+".db", "wb")
	Marshal.dump(Tasks.data, file)
	file.close
end
def LoadDatabase(filename)
	file = File.open(filename+".db", "rb")
	Tasks.data = Marshal.load(file)
	file.close
end
def Quit()
	puts "Are you sure?(Y/N)"
	command = gets.chomp()
	case command
	when /\AY\z|\AYes\z|\AYeah\z/i
		exit
	when /\AN\z|\ANo\z|\ANope\z/i
		return
	end
end
def ShowAllProprieties
	puts "Showing Priority List:"
	data = Tasks.data.collect{|item| item.priority }.uniq
	data.collect{|item|
		puts "Priority: #{item}"
	}
end
def ShowAllTasks
	Tasks.data.each{|item|
		puts "======================="
		puts "Task name: #{item.name}"
		puts "Task type: #{item.type}"
		puts "Task priority: #{item.priority}"
	}
end
def ShowAllTypes
	puts "Showing Type List:"
	data = Tasks.data.collect{|item| item.type }.uniq
	data.each{|item|
		puts "Type: #{item}"
	}
end
