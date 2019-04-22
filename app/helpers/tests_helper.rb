module TestsHelper
  LEVELS = {0 => :easy, 1 => :elementary, 2 => :medium, 3 => :hard}.freeze

  def level_test(test)
    LEVELS[test.level] || :godlike
  end
end
