require('rspec')
require('contacts')

describe('Contacts') do
  it('it returns the first name, last name, job title and company of a contact') do
    test_contact = Contact.new({:first_name => "Taco", :last_name => "Cat", :job_title => "Professional Napper", :company => "Feline Inc"})
    expect(test_contact.first_name()).to(eq("Taco"))
    expect(test_contact.last_name()).to(eq("Cat"))
    expect(test_contact.job_title()).to(eq("Professional Napper"))
    expect(test_contact.company()).to(eq("Feline Inc"))
  end
end
