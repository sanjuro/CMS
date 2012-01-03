Factory.define :user do |user|
  user.name                  'Test'
  user.username              'sanjuro'
  user.password              'rad6hia'
  user.email                 'test@gmail.com'
end

Factory.define :client do |client|
  client.client_number      'C333427046'
  client.title              'Mr'
  client.name               "Test"
  client.surname            "Client"
  client.email_address      "test@eaxmple.com"
end

Factory.define :installation do |installation|
  installation.installation_number      'I333427046'
  installation.client_id                1
  installation.decoder_number_one       "D1231232123"
  installation.smartcard_number_one     "S13123123"
end