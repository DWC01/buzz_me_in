class CreateBuzzMeApps < ActiveRecord::Migration
  def change
    create_table :buzz_me_apps do |t|
    	t.string  :twilio_number
    	t.string  :buzz_in_number
    	t.string  :password

      t.timestamps
    end
  end
end
