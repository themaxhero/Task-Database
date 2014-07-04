#============================================================================================================================================================================================================
# Structure by: maxhero (Marcelo Amancio de Lima Santos)
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Duh?
#============================================================================================================================================================================================================
module Tasks
	extend self
	include Enumerable
	@data = []	
	Task  = Struct.new(:name,:type,:priority)
	def [] index
		return @data[index]
	end
	def []= index, value
		@data[index] = value
	end
	def data
		return @data
	end
	def data= value
		@data = value
	end
	def each &block
		@persons.each do |person|
			if block_given?
				block.call person
			else
				yield person
			end
		end
	end
	def raffle(*args)
		priorities = []
		return puts "There is no Registred Tasks" if data.empty?
		if args.nil?
			data.each{|item| item.priority.times{priorities << item.name}}
		else
			case args[1]
			when /Type/i
				data.collect{|item| item.priority.times{priorities << item.name if item.type == args[0]}}
			when /Priority/i
				data.collect{|item| item.priority.times{priorities << item.name if item.priority == args[0]}}
			end
		end
		size = proprieties.size
		return @data[proprieties[rand(size)]]
	end
end