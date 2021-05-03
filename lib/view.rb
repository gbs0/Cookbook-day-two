class View
  def ask_for(question)
		puts "#{question}"
		gets.chomp
end

	def display(element)
		element.each_with_index do |recipe, index|
      status = recipe.done.zero? ? "[ ]" : "[X]"
			puts "#{index + 1}. - #{recipe.name}, #{recipe.description} \n"
      puts " -- Preparation Time: #{recipe.prep_time} min. | Rating: #{recipe.rating} | Done: #{status}" 
		end
	end
end