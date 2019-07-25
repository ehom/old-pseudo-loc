class AccentService
  def initialize
    # TODO: need to provide a character map
  end

  def localize(text_chars)
    # TODO: not implemented yet
    text_chars
  end
end

class BracketService
  attr_accessor :left_bracket, :right_bracket

  def initialize
    @left_bracket  = "\u00ab"
    @right_bracket = "\u00bb"
  end

  def localize(text_chars)
    text_chars.insert(0, @left_bracket).push(@right_bracket)
  end
end

class ExpanderService
  attr_accessor :padding_char, :expansion

  def initialize
    @padding_char = '_'
    @expansion    = 0.30
  end

  def localize(text_chars)
    repeat  = (text_chars.length * @expansion).ceil
    padding = Array.new(@padding_char, repeat).join

    text_chars.insert(0, padding).push(padding)
  end
end

class FakeLoc
  def initialize
    @accenter  = AccentService.new
    @bracketer = BracketService.new
    @expander  = ExpanderService.new
  end

  def localize(string)
    @a = string.split('')
    accent.expand.bracket.to_s
  end

  def accent
    @a = @accenter.localize(@a)
    self
  end

  def expand
    @a = @expander.localize(@a)
    self
  end

  def bracket
    @a = @bracketer.localize(@a)
    self
  end

  def to_s
    @a.join('')
  end
end
