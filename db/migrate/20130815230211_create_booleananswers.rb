class CreateBooleananswers < ActiveRecord::Migration
  def change
    create_table :booleananswers do |t|
      t.belongs_to :user
    	t.belongs_to :field
    	t.boolean :value
    	
      t.timestamps
    end
  end
end
