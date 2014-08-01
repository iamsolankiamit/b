class BookingDotCom
  def self.url_creator(destination,checkin,checkout,guests)
    base_url = "http://www.booking.com/searchresults.html"
    aid = 388378
    error_url = "http%3A%2F%2Fwww.booking.com%2F%3Faid%3D388378%3B"
    si = "ai%2Cco%2Cci%2Cre%2Cdi"
    lang = "en-gb"
    ss = destination.gsub(/-/,', ')
    checkin_monthday = checkin ? checkin.split('/')[1] : ""
    checkin_month_year = checkin ? "#{ checkin.split('/')[2] }-#{ checkin.split('/')[0]}" : ""
    checkout_monthday = checkout ? checkout.split('/')[1] : ""
    checkout_month_year = checkout ? "#{ checkout.split('/')[2] }-#{ checkout.split('/')[0]}": ""
    "#{base_url}?aid=#{aid}&error_url=#{error_url}&si=#{si}&lang=#{lang}&ss=#{ss}&checkin_monthday=#{checkin_monthday}&checkin_year_month=#{checkin_month_year}&checkout_year_month=#{checkout_month_year}&checkout_monthday=#{checkout_monthday}"
  end
end
