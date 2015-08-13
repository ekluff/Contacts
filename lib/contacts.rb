class Contact
  @@contact = []
  attr_reader(:first_name, :last_name, :job_title, :company)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
  end

  define_method(:save) do
    @@contact.push(self)
  end

  define_singleton_method(:all) do
    @@contact
  end


end
