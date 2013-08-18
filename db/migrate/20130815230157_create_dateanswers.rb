class CreateDateanswers < ActiveRecord::Migration
  def change
    create_table :dateanswers do |t|
    	t.belongs_to :field
    	t.date :value
    	
      t.timestamps
    end
  end
end
