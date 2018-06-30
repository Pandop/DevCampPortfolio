class AddTopicReferenceToBlogs < ActiveRecord::Migration[5.2]
  def change
    #add_reference :blogs, :topic, foreign_key: true
    #add_reference :blogs, :topic, foreign_key: {on_delete: :cascade}
  end
end
