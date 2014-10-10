class Users::ContactsCallbacksController < ApplicationController

  def importer
    @contacts = request.env['omnicontacts.contacts']
    @contacts.each do |contact|
      ReferalEmail.add_gmail_contacts(current_user.id, contact[:email], contact[:first_name], contact[:last_name])
    end
    redirect_to '/i', :notice => "gmail contacts have been referred"
  end
end
