class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
    	t.string :name
    	t.string :data_type
    	t.string :size

      t.timestamps
    end
  end
end
