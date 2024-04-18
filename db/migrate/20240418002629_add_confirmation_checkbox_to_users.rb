class AddConfirmationCheckboxToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :confirmation_checkbox, :boolean
  end
end
