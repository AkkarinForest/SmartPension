class ViewsDataPresenter
  def initialize(views_data)
    @views_data = views_data
  end

  def display
    sort(views_data[:all]).map { |row| display_views_row(row) } +
    separator +
    sort(views_data[:unique]).map { |row| display_unique_views_row(row) }
  end

  private

  attr_reader :views_data

  def separator
    ["", "-" * 32, ""]
  end

  def sort(data)
    data.sort_by(&:last).reverse
  end

  def display_views_row(row)
    display_row(row) + " visits"
  end

  def display_unique_views_row(row)
    display_row(row) + " unique visits"
  end

  def display_row(row)
    row.first.ljust(15) +
    row.last.to_s.rjust(3)
  end
end
