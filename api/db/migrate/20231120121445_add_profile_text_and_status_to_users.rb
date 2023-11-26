class AddProfileTextAndStatusToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile_text, :string
    add_column :users, :status, :integer, default: 1
  end
end
