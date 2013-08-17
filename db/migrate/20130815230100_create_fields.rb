class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
    	t.string :label
    	t.string :brand
    	t.string :size

      t.timestamps
    end
  end
end
