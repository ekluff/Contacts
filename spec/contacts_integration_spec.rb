require('capybara/rspec')
require('./app.rb')
require('launchy')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the contact test path", {:type => :feature}) do
  before() do
    Contacts.clear
    Phone.clear
    Address.clear
    Email.clear
  end

  it('serves the index page that allows a user to view existing and put new contacts') do
    visit('/')
    fill_in('first_name', :with => 'Taco')
    fill_in('last_name', :with => 'Cat')
    fill_in('job_title', :with => 'Professional Napper')
    fill_in('company', :with => 'Feline Inc')
    fill_in('street', :with => '123 uno dos tres calle')
    fill_in('city', :with => 'Barcelona')
    fill_in('state', :with => 'Wyoming')
    fill_in('zip_code', :with => 90210)
    fill_in('address_type', :with => 'home')
    fill_in('phone_number', :with => '503-222-2222')
    fill_in('phone_type', :with => 'home')
    fill_in('email', :with => 't@co.cat')
    fill_in('email_type', :with => 'home')
    click_button('Add Contact')
    expect(page).to have_content('Taco Cat')
  end

end
