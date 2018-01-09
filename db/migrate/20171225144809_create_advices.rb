class CreateAdvices < ActiveRecord::Migration[5.1]
  def change
    create_table :advices do |t|
      t.string :title
      t.text :details

      t.timestamps
    end
  end
end
