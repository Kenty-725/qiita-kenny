class Post < ApplicationRecord
  belongs_to :user

  def formatted_created_at
    created_at.strftime('%Y年%m月%d日')
  end

  def formatted_updated_at
    updated_at.strftime('%Y年%m月%d日')
  end
end
