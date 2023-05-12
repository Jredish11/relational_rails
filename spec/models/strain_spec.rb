require 'rails_helper'

RSpec.describe Strain, type: :model do
  describe 'relationships' do
    it { should belong_to :grow_room }
  end
end