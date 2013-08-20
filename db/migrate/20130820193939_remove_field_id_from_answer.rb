class RemoveFieldIdFromAnswer < ActiveRecord::Migration
  def up
    remove_column :answers, :field_id
  end

  def down

    add_column :answers, :field_id, :integer

  end
end
