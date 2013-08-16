class CreateStringanswers < ActiveRecord::Migration
  def change
    create_table :stringanswers do |t|
      t.belongs_to :user
    	t.belongs_to :field
    	t.string :value

      t.timestamps
    end
  end
end
