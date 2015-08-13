class Contact

  @@contact = []

  attr_reader(:first_name, :last_name, :job_title, :company, :addresses, :phones, :emails)

  # instance methods

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @phones = []
    @addresses = []
    @emails = []
  end

  define_method(:save) do
    @@contact.push(self)
    self # discovered this self was necessary to keep a call of the .save method from returning an array.
  end

  define_method(:new_phone) do |new_phone|
    @phones.push(new_phone)
  end

  define_method(:new_address) do |new_address|
    @addresses.push(new_address)
  end

  define_method(:new_email) do |new_email|
    @emails.push(new_email)
  end

  # Class methods

  define_singleton_method(:all) do
    @@contact
  end

  define_singleton_method(:clear) do
    @@contact = []
  end

end
