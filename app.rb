require('sinatra')
require('sinatra/reloader')
require('./lib/contacts')
require('./lib/addresses')
require('./lib/email')
require('./lib/phone')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  @contacts = Contact.all
  # binding.pry
  erb(:index)
end

post('/new_contact') do

  # params for new contact
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  job_title = params.fetch("job_title")
  company = params.fetch("company")

  # params for new address
  street = params.fetch("street")
  city = params.fetch("city")
  state = params.fetch("state")
  zip_code = params.fetch("zip_code")
  address_type = params.fetch("address_type")

  # params for new phone
  phone_number = params.fetch("phone_number")
  phone_type = params.fetch("phone_type")

  # params for new email
  email = params.fetch("email")
  email_type = params.fetch("email_type")

  # creates Contact instance
  new_contact = Contact.new({:first_name => first_name, :last_name => last_name, :job_title => job_title, :company => company})

  # creates Address, Email, and Phone instances to add to new_contact
  address_to_add = Address.new({:street => street, :city => city, :state => state, :zip_code => zip_code, :type => address_type})

  email_to_add = Email.new({:email => email, :type => email_type})

  phone_to_add = Phone.new({:phone_number => phone_number, :type => phone_type})

  # push address, phone, and email into new_contact
  new_contact.new_address(address_to_add)
  new_contact.new_phone(phone_to_add)
  new_contact.new_email(email_to_add)

  # saves new_contact into @@contact
  new_contact.save()

  @contacts = Contact.all

  erb(:index)
end
