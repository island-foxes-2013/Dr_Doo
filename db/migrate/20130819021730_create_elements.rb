class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
    	t.string :size
    	t.string :data_type
    	t.string :label

      t.timestamps
    end
  end
end
