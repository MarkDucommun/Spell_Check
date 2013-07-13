class ClosestWord
  
  def initialize user_input
    @user_input = user_input
    @best_match = ""
    @best_num_of_matchs = 0
  end
  
  def get_user_input
    puts "Enter a word:\n"
    @user_input = gets.chomp
  end
  
  def compare_user_input(dictionary_array)
    dictionary_array.each do |word|
      if word == @user_input
        return "#{@user_input} is already the correct spelling."
      else
        compare_word(word)
      end
    end
    return "Did you mean #{@best_match}?"
  end
   
  def compare_word(word)
    (num_of_loops? word).times do |index|
      compare_position index, word
    end
  end
  
  def compare_position index, word
    index_of_word = index_of_word? index, word
    index_of_user_input = index_of_user_input? index, word
    temp_matchs = 0
    (length_of_comparison? index, word).times do |secondary_index|
      temp_matchs += 1 if word[index_of_word + secondary_index] == @user_input[index_of_user_input + secondary_index]
    end
    better_match? temp_matchs, word
    temp_matchs
  end
  
  def better_match? matchs, word
    if matchs > @best_num_of_matchs
      @best_num_of_matchs = matchs
      @best_match = word
    end
  end
    
  def num_of_loops? word
    word.length + @user_input.length - 1
  end
  
  def length_of_comparison? index, word
    length = 0 
     max_length = max_length_of_comparison? word
     if index < (max_length - 1)
       length = index + 1
     elsif index < (num_of_loops? word) - (max_length - 1)
       length = max_length
     else
       length = (num_of_loops? word) - index
     end
     length
  end
  
  def max_length_of_comparison? word
    max_comparisons = 0
    word.length > @user_input.length ? max_comparisons = @user_input.length : max_comparisons = word.length
    max_comparisons
  end
  
  def index_of_word? index, word
    word_index = 0
    word_index = word.length - index - 1 if index < word.length
    word_index
  end
  
  def index_of_user_input? index, word
    user_input_index = 0
    user_input_index = index - word.length + 1 if index >= word.length
    user_input_index
  end
end

class InputReaderHelper  
  def read_file file_input
    file = File.open(file_input)
    data = file.read.split("\n")
    data
  end
end
