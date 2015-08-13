require('rspec')
require('contacts')

describe('Contacts') do
  before() do
    Contact.clear
  end

  it('is empty at first') do
    expect(Contact.all).to(eq([]))
  end

  it('it returns the first name, last name, job title and company of a contact') do
    test_contact = Contact.new({:first_name => "Taco", :last_name => "Cat", :job_title => "Professional Napper", :company => "Feline Inc"})
    expect(test_contact.first_name()).to(eq("Taco"))
    expect(test_contact.last_name()).to(eq("Cat"))
    expect(test_contact.job_title()).to(eq("Professional Napper"))
    expect(test_contact.company()).to(eq("Feline Inc"))
  end

  describe('#save') do
    it('saves and makes retrievable multiple contacts') do
      Contact.new({:first_name => "Taco", :last_name => "Cat", :job_title => "Professional Napper", :company => "Feline Inc"}).save()
      Contact.new({:first_name => "Burrito", :last_name => "Dog", :job_title => "Professional Licker", :company => "Canine SA"}).save()
      Contact.new({:first_name => "Empanada", :last_name => "Fish", :job_title => "Professional Finger Follower", :company => "Pescado Gmbh"}).save()
      expect(Contact.all[1].job_title()).to(eq("Professional Licker"))
    end
  end
end
