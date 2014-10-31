class Users::ContactsCallbacksController < ApplicationController

  def importer
    @contacts = request.env['omnicontacts.contacts']
    @contacts.each do |contact|
      ReferalEmail.add_gmail_contacts(1, contact[:email])
    end
    redirect_to '/contest', :notice => "Gmail Contacts have been refered, share and tweet to increase your chance to win."
  end
end
