Roomnhouse.Offer = DS.Model.extend
  visiblity: DS.attr('boolean')
  email: DS.attr('string')
  contact_phone: DS.attr('string')
  contact_phone_backup: DS.attr('string')
  object_type: DS.attr('string')
  size: DS.attr('number')
  size_type: DS.attr('string')
  bathroom_count: DS.attr('number')
  max_guest_count: DS.attr('number')
  bed_count: DS.attr('number')
  bedroom_count: DS.attr('number')
  bed_type: DS.attr('string')
  allow_marketing: DS.attr('boolean')
  street: DS.attr('string')
  street_no: DS.attr('string')
  address_addon: DS.attr('string')
  city: DS.attr('string')
  zip: DS.attr('number')
  country_code_iso: DS.attr('number')
  currency: DS.attr('string')
  nightly_rate_amount: DS.attr('number')
  weekly_rate_amount: DS.attr('number')
  monthly_rate_amount: DS.attr('number')
  extra_guest_charge_amount: DS.attr('number')
  included_guest_count: DS.attr('number')
  service_charge_amount: DS.attr('number')
  cancelation_policy: DS.attr('string')
  min_nights: DS.attr('number')
  max_nights: DS.attr('number')
  checkin_after: DS.attr('number')
  checkout_before: DS.attr('number')
  confidential_lng: DS.attr('number')
  confidential_lat: DS.attr('number')
  geo_precision: DS.attr('number')
  is_verified: DS.attr('boolean')
  user: DS.belongsTo('user')
  translations: DS.hasMany('translation')
  photos: DS.hasMany('photo')