require 'rails_helper'

RSpec.describe Trie::Tree, type: :service do
  describe 'search' do
    it 'seacrhes for a given string' do
      tree = Trie::Tree.new
      tree.insert('cat')
      tree.insert('car')
      tree.insert('coal')

      words = tree.search('c')
      expect(words).to include('cat')
      expect(words).to include('car')
      expect(words).to include('coal')
    end
  end
end
