class Post < ApplicationRecord
  belongs_to :user

  def formatted_date
    created_at.strftime('%Y年%m月%d日')
  end
end
