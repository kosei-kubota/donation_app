require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe '#create' do
    before do
      @donation = FactoryBot.build(:donation)
    end

    context '寄付投稿ができる時' do
      it 'name、price、descriptionが存在すれば登録できる' do
        expect(@donation).to be_valid
      end
    end

    context '寄付投稿ができない時' do
      it 'nameが空では登録できない' do
        @donation.name = ''
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Name can't be blank")
      end
  
      it 'priceが空では登録できない' do
        @donation.price = ''
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Price can't be blank")
      end
  
      it 'descriptionが空では登録できない' do
        @donation.description = ''
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Description can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @donation.user = nil
        @donation.valid?
        expect(@donation.errors.full_messages).to include('User must exist')
      end

      it 'nameが40文字以上では保存できない' do
        @donation.name = 41
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Name is invalid")
      end

      it 'descriptionが1000文字以上では保存できない' do
        @donation.description = 1001
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Description is invalid")
      end

      it 'priceが¥0以内では保存できない' do
        @donation.price = 0
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが¥9,999,999以上では保存できない' do
        @donation.price = 10000000
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが半角数字以外では保存できない' do
        @donation.price = 'aaaあああ'
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが全角文字では保存できない' do
        @donation.price = 'あああ'
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが半角英数混合では保存できない' do
        @donation.price = 'aaa111'
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが半角英語だけでは保存できない' do
        @donation.price = 'aaa'
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Price is out of setting range")
      end
    end 
  end
end
