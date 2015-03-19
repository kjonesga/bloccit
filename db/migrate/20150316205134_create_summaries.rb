class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.text :decription

      t.timestamps null: false
    end
  end
end
