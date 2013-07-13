require 'test/unit'
require 'ClosestWord'

class ClosestWordTest < Test::Unit::TestCase
  
  @@dictionary = ['apple', 'bacon', 'cemetery', 'google']
  
#  def test_get_user_input
#    puts "Enter 'cemetary'\n"
#    assert_equal "cemetary", ClosestWord.new("").get_user_input
#  end
  
  def test_compare_user_input_correct_spelling
    test = ClosestWord.new("cemetery")
    assert_equal "cemetery is already the correct spelling.", test.compare_user_input(@@dictionary)
  end
  
  def test_compare_user_input
    test = ClosestWord.new("cemetary")
    assert_equal "Did you mean cemetery?", test.compare_user_input(@@dictionary)
  end
  
  def test_num_of_loops?
    test = ClosestWord.new("four")
    assert_equal 6, test.num_of_loops?("the")
  end
  
  def test_length_of_comparison?
    test = ClosestWord.new("four")
    length_of_comparison_expected = [1,2,3,3,2,1]
    6.times {|index| assert_equal length_of_comparison_expected[index], test.length_of_comparison?(index, "the")}
      
    test = ClosestWord.new("cemetary")
  end
  
  def test_max_length_of_comparison?
    test = ClosestWord.new("four")
    assert_equal 3, test.max_length_of_comparison?("the")
    assert_equal 4, test.max_length_of_comparison?("apple")
  end
  
  def test_index_of_word?
    test = ClosestWord.new("four")
    word_index_expected = [2,1,0,0,0,0] 
    6.times {|index| assert_equal word_index_expected[index], test.index_of_word?(index,"the")}

    test = ClosestWord.new("cemetery")
    word_index_expected = [2,1,0,0,0,0,0,0,0,0]
    10.times {|index| assert_equal word_index_expected[index], test.index_of_word?(index,"the")}
  end
  
  def test_index_of_user_input?
    
    test = ClosestWord.new("four")
    user_index_expected = [0,0,0,1,2,3]
    6.times {|index| assert_equal user_index_expected[index], test.index_of_user_input?(index, "the")}
    
    test = ClosestWord.new("cemetery")
    user_index_expected = [0,0,0,1,2,3,4,5,6,7]
    10.times {|index| assert_equal user_index_expected[index], test.index_of_user_input?(index, "the")}
  end
  
  def test_compare_position
    test = ClosestWord.new("apples")
    matchs_expected = [0,1,3,1,0,0,0,0]
    8.times {|index| assert_equal matchs_expected[index], test.compare_position(index, "app")}
  end
  
  def test_read_file
    assert_equal ["2"], InputReaderHelper.new.read_file('C:\Users\Mark\workspace\Hack_Night\test_input.txt')
  end
  
  def test_all_functionality
    test = ClosestWord.new("")
    dictionary = InputReaderHelper.new.read_file('C:\Users\Mark\workspace\Hack_Night\corncob_lowercase.txt')
    test.get_user_input
    puts test.compare_user_input(dictionary)
  end
end
