class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.references :tag, foreign_key: true
      t.references :hint, foreign_key: true

      t.timestamps
    end
  end
end
