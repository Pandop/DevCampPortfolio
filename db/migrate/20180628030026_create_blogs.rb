class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      #t.references :topic, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
