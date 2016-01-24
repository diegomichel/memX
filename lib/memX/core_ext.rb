# Adds count_word to class string, words followed by special chars like comas,
# points, etc aren't counted properly.
String.class_eval do
  def count_word(string)
    word_counts = {}
    self.split(/\?| |,|\"|\'/).each do |word|
      word_counts[word.to_sym] ||= 0
      word_counts[word.to_sym] = word_counts[word.to_sym] + 1
    end
    word_counts[string.to_sym] ||= 0
    word_counts[string.to_sym]
  end
end
