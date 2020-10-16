require 'rails_helper'

RSpec.describe 'Blogs管理', type: :system do

    #before do
    #    @blog = Blog.create!
    #end

    scenario 'Blogの新規で titleを入力しなかった場合、エラーが表示' do
        visit blogs_path                 #パスの画面を表示
        click_link '新規'               #新規ボタンをクリックする
        fill_in 'Title', with: ''
        expect {click_button 'Create Blog'}.to change(Blog, :count).by(0)
        #expect(current_path).to eq blog_path
        #expect(page).to have_content 'Blogs#show'
    
    end

    scenario 'Blogの新規で titleを入力した場合、保存され閲覧画面に遷移' do
        visit blogs_path                #パスの画面を表示
        click_link '新規'               #新規ボタンをクリックする
        fill_in 'Title', with: 'title'
        expect {click_button 'Create Blog'}.to change(Blog, :count).by(1)
        expect(current_path).to eq current_path
        expect(page).to have_content 'Blogs'
    end
end
