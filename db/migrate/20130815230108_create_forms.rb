class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.belongs_to :user
      t.string :title
      
      t.timestamps
    end
  end
end
