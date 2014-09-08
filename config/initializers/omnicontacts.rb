require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "90391904170-d05c1hq4i6c2vvhseoips4fdgfdrkcss.apps.googleusercontent.com", "KenGQ1DOhxUsUWoqIXQt1tPV", :max_results => 10000
  
end