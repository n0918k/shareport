require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  before do
    @portfolio = FactoryBot.build(:portfolio)
    @portfolio.image = fixture_file_upload('spec/fixtures/test_image.png')
  end

  describe 'ポートフォリオが登録' do
    context 'ポートフォリオが登録できるとき' do
      it '全て入力され画像があると登録できる' do
        expect(@portfolio).to be_valid
      end
    end

    context 'ポートフォリオが登録できないとき' do
      it 'アプリ名がなければ登録できない'do
        @portfolio.name = nil
        @portfolio.valid?
        expect(@portfolio.errors.full_messages).to include("アプリ名を入力してください")
      end

      it 'リンクがなければ登録できない' do
        @portfolio.link = nil
        @portfolio.valid?
        expect(@portfolio.errors.full_messages).to include("リンクを入力してください")
      end

      it '画像がなければ登録できない'do
        @portfolio.image = nil
        @portfolio.valid?
        expect(@portfolio.errors.full_messages).to include("画像を入力してください")
      end
    end
  end
end