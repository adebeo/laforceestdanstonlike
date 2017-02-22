class CreateCheckins < ActiveRecord::Migration[5.0]
  def change
    create_table :checkins do |t|
	    t.string :ip
		t.integer :user_id
	    t.integer :site_id
  	    t.timestamps    	
    end
  end
end
