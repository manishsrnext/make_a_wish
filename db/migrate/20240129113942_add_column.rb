class AddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_type, :integer
    add_column :wishes, :status, :integer
  end
end
