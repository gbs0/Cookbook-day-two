class View
  def ask_for(question)
		puts "#{question}"
		gets.chomp
	end

	def display(element)
		element.each_with_index do |recipe, index|
			puts "#{index + 1}. - #{recipe.name}, #{recipe.description}"
		end
	end
end