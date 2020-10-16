require 'rails_helper'

#describe Blog, type: :model do
describe Blog do
  #pending "add some examples to (or delete) #{__FILE__}"

  it "titleがあれば有効であること" do
    @blog = Blog.new(title: "にゃんにゃんブログ")
    expect(@blog).to be_valid
  end

  it "titleがなければ無効であること" do
    @blog = Blog.new(title: nil)
    expect(@blog.valid?).to eq(false)
  end
end
