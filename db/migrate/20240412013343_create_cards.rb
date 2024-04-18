class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :card_name
      t.string :collection_name

      t.timestamps
    end
  end
end
