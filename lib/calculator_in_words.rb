def calculator_in_words(evaluation)
  evaluation.downcase!
  cleaned_string = evaluation.gsub(/what|is|by|the|power|rd|nd|st|th|\?|\s/, '')
  operator_string = cleaned_string.gsub(/plus|minus|divided|to|times/, 'plus' => '+', 'minus' => '-', 'times' => '*', 'divided' => '/', 'to' => '^' )
  saved_string = operator_string
  numbers_to_evaluate = operator_string.split(/[^0-9\.]/)
  numbers_to_evaluate.reject! { |v| v.empty? }
  operator_symbols = saved_string.gsub(/\./,'').split(/\d/).reject! { |v| v.empty? }

  if operator_symbols[0] == '^'
    result = numbers_to_evaluate[0].to_f**numbers_to_evaluate[1].to_f
  else
    result = numbers_to_evaluate[0].to_f.send(operator_symbols[0],numbers_to_evaluate[1].to_f)
  end

  if numbers_to_evaluate.length > 2 
    result = result.send(operator_symbols[1], numbers_to_evaluate[2].to_f)
  end

  trim(result)

end

def split_questions(questions)
  answers_array = []
  questions_array = questions.split(/(.*?)\?/).reject! { |v| v.empty? }
  questions_array.each do |question|
    answers_array << calculator_in_words(question)
  end
  answers_array
end

def trim (number)
  i = number.to_i
  f = number.to_f
  i == f ? i : f
end

puts split_questions("What is 8 to 2nd power? what is 2 times 7?")
# puts calculator_in_words("What is 6 plus 8")
