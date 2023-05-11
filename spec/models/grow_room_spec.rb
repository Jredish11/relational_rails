require 'rails_helper'

RSpec.describe GrowRoom, type: :model do
  describe "relationship, parent to child" do
    it { should have_many :strains }
  end
end