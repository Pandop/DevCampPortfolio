class ChangePercentUtitlizedForSkills < ActiveRecord::Migration[5.2]
  def change
    rename_column('skills','percent_utitlized','percent_completed')
  end
end
