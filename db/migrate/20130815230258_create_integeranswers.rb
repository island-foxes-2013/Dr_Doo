class CreateIntegeranswers < ActiveRecord::Migration
  def change
    create_table :integeranswers do |t|
    	t.belongs_to :field
    	t.integer :value
    	
      t.timestamps
    end
  end
end
