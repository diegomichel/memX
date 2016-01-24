require 'test_helper'

class CoreExtTest < ActiveSupport::TestCase
  def test_count_word_counts_words
    assert_equal 2, "Hello diego, how are you diego?".count_word("diego")
  end
end
