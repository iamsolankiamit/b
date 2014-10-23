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
    http_get(domain,path,params)
  end

  def http_get(domain,path,params)
    return Net::HTTP.get(domain, "#{path}?".concat(params.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.join('&'))) if not params.nil?
    return Net::HTTP.get(domain, path)
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
    http_get(domain,path,params)
  end
end

