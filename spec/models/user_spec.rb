require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できるとき' do
      it '全て入力されていると登録できる' do
        expect(@user).to be_valid
      end
    end

    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end
    it 'emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
    end
    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
    end
    it 'emailに一意性がないと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
    end
    it 'パスワードが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end
    it 'passwordが5文字以下だと登録できない' do
      @user.password = 'cd123'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'passwordが英語のみだと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
    it 'passwordが数字のみだと登録できない' do
      @user.password = '111111'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
    it 'passwordに全角が入っていると登録できない' do
      @user.password = 'n１２３４５ds'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
    it 'ユーザー本名の名字がないと登録できない' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('姓を入力してください')
    end
    it 'ユーザー本名の名前がないと登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('名を入力してください')
    end
    it 'ユーザー本名の名字に英数字が含まれていると登録できない' do
      @user.family_name = 'ac123'
      @user.valid?
      expect(@user.errors.full_messages).to include('姓は不正な値です')
    end
    it 'ユーザー本名の名前に英数字が含まれていると登録できない' do
      @user.first_name = 'ac123'
      @user.valid?
      expect(@user.errors.full_messages).to include('名は不正な値です')
    end
    it 'ユーザー本名の名字のフリガナがないと登録できない' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('姓(カナ)を入力してください')
    end
    it 'ユーザー本名の名前のフリガナがないと登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('名(カナ)を入力してください')
    end
    it 'ユーザー本名の名のフリガナが全角でないと登録できない' do
      @user.first_name_kana = 'ｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名(カナ)は不正な値です')
    end
    it 'ユーザー本名の名前のフリガナが全角でないと登録できない' do
      @user.first_name_kana = 'ｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名(カナ)は不正な値です')
    end
    it '生年月日が空だと登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('誕生日を入力してください')
    end
  end
end
