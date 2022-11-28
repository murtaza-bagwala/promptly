require 'rails_helper'

RSpec.describe Trie::Node, type: :model do
  describe 'validations' do
    subject { build(:course) }

    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
  end

  describe 'associations' do
    subject { build(:course) }

    it { is_expected.to have_many(:talents) }
    it { should belong_to(:author).class_name('User') }
    it { is_expected.to have_many(:user_courses) }
  end
end
