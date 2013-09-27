module Helpers
  def ensure_on(path)
    visit(path) unless current_path == path
  end
end

RSpec.configure do |config|
  config.include Helpers, :type => :request
end
