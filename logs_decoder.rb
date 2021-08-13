class LogsDecoder
  def call(file)
    file.split("\n").map(&:split)
  end
end
