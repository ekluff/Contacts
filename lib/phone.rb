class Phone
  @@phone = []

  attr_reader(:phone_number, :type)

  define_method(:initialize) do |attributes|
    @phone_number = attributes.fetch(:phone_number)
    @type = attributes.fetch(:type)
  end

  define_method(:save) do
    @@phone.push(self)
    self
  end

  define_singleton_method(:all) do
    @@phone
  end

  define_singleton_method(:clear) do
    @@phone = []
  end
end
