require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'チャットルーム作成' do
    context '新規作成できるとき' do
      it 'nameが存在すれば作成できる' do
        
      end
    end
    context '新規作成できないとき' do
      it 'nameが空では作成できない' do
        
      end
    end
  end
end
