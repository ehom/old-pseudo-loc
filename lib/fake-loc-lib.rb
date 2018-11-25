
class AccentService
  def initialize
    # TODO need to provide a character map
  end

  def localize(a)
    # TODO not implemented yet
    a
  end
end

class BracketService
  attr_accessor :left_bracket, :right_bracket

  def initialize
    @left_bracket  = "\u00ab"
    @right_bracket = "\u00bb"
  end

  def localize(a)
    a.insert(0, @left_bracket).push(@right_bracket)
  end
end

class ExpanderService
  attr_accessor :padding_char, :expansion

  def initialize
    @padding_char = "_"
    @expansion    = 0.30
  end

  def localize(a)
    padding = [].fill(@padding_char, 0, (a.length * expansion).ceil).join('')
    a.insert(0, padding).push(padding)
  end
end


class FakeLoc
  def initialize
    @accenter  = AccentService.new
    @bracketer = BracketService.new
    @expander  = ExpanderService.new
  end

  def localize(s)
    @a = s.split('')
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
