require 'net/http'
require 'uri'
class SmsSender
  def guest_booking_done(guest, trip,booking)

    str1 = "<?xml version='1.0' encoding='iso-8859-1'?>
<smslist>
 <sms>
  <user>rnhcom</user>
  <password>aruhat123</password>
  <message>Your Booking request has been made. Confirmation from host is remaining. Thanks for using roomnhouse</message>
  <mobiles>09869623821</mobiles>
  <accountusagetypeid>1</accountusagetypeid>
 </sms>
</smslist>"
    puts str1
    uri = URI("http://www.vibgyortel.in/apps/sendsms.jsp")
    http = Net::HTTP.new(uri.host,uri.port)
    response = http.post(uri.path,str1, initheader = {"Content-Type" => "application/xml"})
  end

  def host_new_booking(guest,host, trip, booking)

    str1 = "<?xml version='1.0' encoding='iso-8859-1'?>
<smslist>
 <sms>
  <user>rnhcom</user>
  <password>aruhat123</password>
  <message>You have new booking check it out on roomnhouse.com</message>
  <mobiles>09869623821</mobiles>
  <accountusagetypeid>1</accountusagetypeid>
 </sms>
</smslist>"
    puts str1
    uri = URI("http://www.vibgyortel.in/apps/sendsms.jsp")
    http = Net::HTTP.new(uri.host,uri.port)
    response = http.post(uri.path,str1, initheader = {"Content-Type" => "application/xml"})

  end
end

