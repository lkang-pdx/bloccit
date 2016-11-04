class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :title
      t.text :body
      t.integer :price
      t.references :topic, index: true

      t.timestamps null: false
    end
    add_foreign_key :podcasts, :topics
  end
end
