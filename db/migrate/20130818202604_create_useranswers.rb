class CreateUseranswers < ActiveRecord::Migration
  def change
    create_table :useranswers do |t|
      t.belongs_to :form
    	t.belongs_to :user
    	t.references :answer, polymorphic: true
    	
      t.timestamps
    end
  end
end
