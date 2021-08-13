class ViewsCounter
  def call(views_log)
    ViewsCount.new(
      total: group_by_path(views_log),
      unique:  group_by_path(views_log.uniq),
    )
  end

  def group_by_path(views_log)
    views_log.map(&:first).tally
  end
end

ViewsCount = Struct.new(:total, :unique, keyword_init: true)
