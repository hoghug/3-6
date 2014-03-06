def calculator_in_words(evaluation)
  final_answer = 0;
  evaluation.downcase!
  cleaned_string = evaluation.gsub(/what|is|by|the|power|rd|nd|st|th|\?|\s/, '')
  operator_string = cleaned_string.gsub(/plus|minus|divided|to|times/, 'plus' => '+', 'minus' => '-', 'times' => '*', 'divided' => '/', 'to' => '^' )
  saved_string = operator_string
  numbers_to_evaluate = operator_string.split(/\D/)
  numbers_to_evaluate.reject! { |v| v.empty? }
  operator_symbols = saved_string.split(/\d/).reject! { |v| v.empty? }

  if operator_symbols[0] == '^'
    result = numbers_to_evaluate[0].to_i**numbers_to_evaluate[1].to_i
  else
    result = numbers_to_evaluate[0].to_i.send(operator_symbols[0],numbers_to_evaluate[1].to_i)
  end

  if numbers_to_evaluate.length > 2 
    result = result.send(operator_symbols[1], numbers_to_evaluate[2].to_i)
  end

  result


end

puts calculator_in_words("What is 6 plus 8")
