class Dog < Animal

  attr_reader :bark

  def initialize(
    properties = {}
  )
    puts '== constructing a dog =='
    super
    @bark = properties['bark'] || nil
  end

  def bark=(value)
    @bark = value.nil? ? nil : value.slice(0..MAX_STR_LENGTH)
  end

  def to_h
    super.merge(
        {
            :bark => @bark
        })
  end

  def to_json(*a)
    {
        :json_class => self.class.name,
        :data => self.to_h
    }.to_json(*a)
  end


  def self.json_create(*o)

    puts "Calling #{self.inspect}::#{__method__}"
    pp(*o)

    new(
        o[0]['data'],
    )
  end

end