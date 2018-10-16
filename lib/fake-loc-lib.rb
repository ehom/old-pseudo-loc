class FakeLoc
  attr_accessor :left_bracket, :right_bracket
  attr_accessor :padding_char, :expansion

  def initialize
    @padding_char = "_"
    @expansion = 0.30
    @left_bracket = "\u00ab"
    @right_bracket = "\u00bb"
  end

  def localize(s)
    @a = s.split('')
    accent.expand.bracket.to_s
  end

  def accent
    # TODO
    self
  end

  def expand
    padding = [].fill(@padding_char, 0, (@a.length * @expansion).ceil).join('')
    @a.insert(0, padding).push(padding)
    self
  end

  def bracket
    @a.insert(0, @left_bracket).push(@right_bracket)
    self
  end

  def to_s
    @a.join('')
  end
end
