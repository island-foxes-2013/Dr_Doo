class CreateFieldsForms < ActiveRecord::Migration
  def change
     create_table :fields_forms, :id => false  do |t|
      t.integer :field_id
      t.integer :user_id
    end
  end
end
