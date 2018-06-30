class UpdateForiegnKeyConstraint < ActiveRecord::Migration[5.2]
  def change
    #remove_foreign_key :blogs, :topic
    #add_foreign_key    :blogs, :topic, on_delete: :cascade
  end
end
