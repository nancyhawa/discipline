require 'rails_helper'

RSpec.describe School, type: :model do
  describe "new" do
    it "instantiates a new instance of a school" do
      school = School.new()
    end
  end
end
