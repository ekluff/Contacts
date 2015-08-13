class Address

  @@address = []

  attr_reader(:street, :city, :state, :zip_code, :type)

  # instance methods

  define_method(:initialize) do |attributes|
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip_code = attributes.fetch(:zip_code)
    @type = attributes.fetch(:type)
  end

  define_method(:save) do
    @@address.push(self)
  end

  define_singleton_method(:all) do
    @@address
  end

  define_singleton_method(:clear) do
    @@address = []
  end




end
