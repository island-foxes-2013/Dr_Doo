class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
    	t.belongs_to :form
    	t.belongs_to :element
    	t.string :label

      t.timestamps
    end
  end
end
