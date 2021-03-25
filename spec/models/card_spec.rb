require 'rails_helper'

RSpec.describe Card, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      @card = FactoryBot.build(:card, user_id: user.id)
    end
  end

  context 'カード登録ができる時' do
    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@card).to be_valid
    end
  end

  context 'カード登録ができない時' do
    it 'card_tokenが空では保存できない' do
      @card.card_token = ''
      @card.valid?
      expect(@card.errors.full_messages).to include("Card token can't be blank")
    end

    it 'customer_tokenが空では保存できない' do
      @card.customer_token = ''
      @card.valid?
      expect(@card.errors.full_messages).to include("Customer token can't be blank")
    end

    it 'userが紐付いていないと保存できない' do
      @card.user_id = nil
      @card.valid?
      expect(@card.errors.full_messages).to include("User can't be blank")
    end
  end
end
