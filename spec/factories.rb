Factory.define :client do |client|
  client.title              'Mr'
  client.client_number      'C12341234'
  client.name               "Test"
  client.surname            "Client"
  client.email_address      "test@eaxmple.com"
end

Factory.define :installation do |installation|
  installation.installation_number      'I333427046'
  installation.client_number            'C12341234'
  installation.decoder_number_one       "D1231232123"
  installation.smartcard_number_one     "S13123123"
end

Factory.define :installer do |installer|
  installer.name               "Test"
  installer.surname            "Installer"
  installer.contact_number     "0831231212"
end

Factory.define :smp_rep do |smp_rep|
  smp_rep.title              'Mr'
  smp_rep.name               "Test"
  smp_rep.surname            "Smprep"
  smp_rep.contact_number     "0831231212"
end

Factory.define :user do |user|
  user.name                  'Test'
  user.username              'sanjuro'
  user.password              'rad6hia'
  user.email                 'test@gmail.com'
end