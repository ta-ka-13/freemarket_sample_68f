module ItemsHelper
  def expMonthYear(card_date)
    exp_date = "#{card_date.exp_month.to_s} / #{card_date.exp_year.to_s.slice(2,3)}"
  end
end