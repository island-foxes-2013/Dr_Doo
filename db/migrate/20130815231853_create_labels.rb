class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
    	t.belongs_to :form
    	t.belongs_to :field
    	t.string :name

      t.timestamps
    end
  end
end
