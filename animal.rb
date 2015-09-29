class Animal

  MAX_STR_LENGTH = 16

  attr_reader :has_fur
  attr_reader :color
  attr_reader :name

  def initialize(
    has_fur = false,
    color   = nil,
    name    = nil
  )
    puts '== constructing an animal =='

    @has_fur  = has_fur
    @color    = color
    @name     = name
  end

  def color=(value)
    @color = value.nil? ? nil : value.slice(0..MAX_STR_LENGTH)
  end

  def has_fur=(value)
    @has_fur = value.nil? ? nil : value
  end

  def name=(value)
    @name = value.nil? ? nil : value.slice(0..MAX_STR_LENGTH)
  end

  def to_h
    {
        :has_fur  => has_fur,
        :color    => color,
        :name     => name
    }
  end

  def to_json(*a)
    {
        :json_class => self.class.name,
        :data => self.to_h
    }.to_json(*a)
  end

  def self.json_create(*o)
    puts "Calling #{self.inspect}::#{__method__}"
    pp(o)
    new(
        o[0]['data']['has_fur'],
        o[0]['data']['color'],
        o[0]['data']['name']
    )
  end

end