class CreateAptBuzzers < ActiveRecord::Migration
  def change
    create_table :apt_buzzers do |t|
      t.string   :phone_number
      t.string   :password
      t.string   :dtmf_signal	

      t.timestamps
    end
  end
end
