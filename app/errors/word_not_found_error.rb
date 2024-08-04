class WordNotFoundError < StandardError
  def message
    "Word not found"
  end
end
