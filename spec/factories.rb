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