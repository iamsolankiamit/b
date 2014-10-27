require 'net/http'
require 'uri'
require "cgi"
class SmsSender


  def initialize(guest,host,trip,booking)
    guest_booking_done_sms(guest,trip,booking)
    host_new_booking(guest,host,trip,booking)
  end

  def guest_booking_done_sms(guest, trip,booking)
    message = "Your Booking request has been made you will be notified within 24hrs."
    pass="RakeshAmit@1"
    senderId= "RNHCOM"
    mobile = 9638462979
    to = guest.phone
    domain = "http://trans.boommail.in"
    path = "/SmsStatuswithId.aspx"
    params = {mobile: mobile,pass: pass,senderid: senderId, to: to, msg: message}
    @gres = http_get(domain,path,params)
  end

  def http_get(domain,path,params)
    uri = URI("#{domain}#{path}")
    uri.query = URI.encode_www_form(params)
    req = Net::HTTP.get_response(uri)
    Rails.logger.debug "some objects #{uri.inspect} #{uri.to_s} #{req.to_s} #{req.inspect}"
    return req
  end

  def host_new_booking(guest,host, trip, booking)
    message = "You have new booking check it on roomnhouse.com"
    pass="RakeshAmit@1"
    senderId= "RNHCOM"
    mobile = 9638462979
    to = host.phone
    domain = "http://trans.boommail.in"
    path = "/SmsStatuswithId.aspx"
    params = {mobile: mobile,pass: pass,senderid: senderId, to: to, msg: message}
    @hres = http_get(domain,path,params)
  end
end

