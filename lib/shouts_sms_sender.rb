require 'net/http'
require 'uri'
class ShoutSmsSender

	def initialize(phone,shout)
		shout_sms(phone,shout)
	end


	def shout_sms(phone,shout)
		str1 = "<?xml version='1.0' encoding='iso-8859-1'?>
		<smslist>
		<sms>
		<user>rnhcom</user>
		<password>aruhat123</password>
		<message>You have new SHOUT available if you are interested with the Budget for your property you can confirm!! </message>
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