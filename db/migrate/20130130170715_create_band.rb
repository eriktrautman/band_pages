class CreateBand < ActiveRecord::Migration
  def up
  	create_table :band do |t|
  		t.string :name

  		t.timestamps
  	end
  end

  def down
  	drop_table :band
  end
end
