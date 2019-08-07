module ExperienceLevel
  extend ActiveSupport::Concern

  included do
    enum level: { intern: 1, junior: 2, full: 3, senior: 4, expert: 5}
  end
end