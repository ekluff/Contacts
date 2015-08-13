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

  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  job_title = params.fetch("job_title")
  company = params.fetch("company")

  street = params.fetch("street")
  city = params.fetch("city")
  state = params.fetch("state")
  zip_code = params.fetch("zip_code")
  address_type = params.fetch("address_type")

  phone_number = params.fetch("phone_number")
  phone_type = params.fetch("phone_type")

  email = params.fetch("email")
  email_type = params.fetch("email_type")

  new_contact = Contact.new({:first_name => first_name, :last_name => last_name, :job_title => job_title, :company => company})

  address_to_add = Address.new({:street => street, :city => city, :state => state, :zip_code => zip_code, :type => address_type})

  #
  #
  # Phone.new(phone_number, phone_type).save()
  # Email.new(email, email_type).save()
  #
  new_contact.new_address(address_to_add)

  new_contact.save()

  @contacts = Contact.all
  erb(:index)
end
