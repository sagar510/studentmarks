class Addongoing < ActiveRecord::Migration[6.0]
  def change
    add_column :courses,:ongoing,:boolean
  end
end
