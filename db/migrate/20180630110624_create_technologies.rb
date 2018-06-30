class CreateTechnologies < ActiveRecord::Migration[5.2]
  def change
    create_table :technologies do |t|
      t.string :name
      t.references :portfolio, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
