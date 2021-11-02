require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  it 'textが空の場合はコメントは保存できない' do
    @comment.text = ''
    @comment.valid?
    expect(@comment.errors.full_messages).to include("Text can't be blank")
  end

  it 'ユーザーが紐付いていなければ保存できない' do
    @comment.user = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include("User must exist")
  end

  it 'ツイートが紐付いていなければ保存できない' do
    @comment.tweet = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include("Tweet must exist")
  end
end
