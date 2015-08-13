class Email
  @@email = []

  attr_reader(:email_address, :type)

  define_method(:initialize) do |attributes|
    @email_address = attributes.fetch(:email_address)
    @type = attributes.fetch(:type)
  end

  define_method(:save) do
    @@email.push(self)
    self
  end

  define_singleton_method(:all) do
    @@email
  end

  define_singleton_method(:clear) do
    @@email = []
  end
end
