class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.belongs_to :form
    	t.belongs_to :user
    	t.belongs_to :field

      t.timestamps
    end
  end
end
