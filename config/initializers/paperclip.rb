Paperclip::Attachment.default_options.merge!(
  url: ':s3_alias_url',
  s3_host_alias: 'dm1w09da1rt65.cloudfront.net', 
  path:                 '/:class/:attachment/:id_partition/:style/:filename',
  storage:              :s3,
  s3_credentials:       Rails.configuration.aws,
  s3_permissions:       :private,
  s3_protocol:          'https'
)
