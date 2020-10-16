class Blog < ApplicationRecord
    has_many :entries, dependent: :destroy
    validates :title, presence: { message: 'は必須入力です。'}
end
