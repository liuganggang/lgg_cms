class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name, comment: "姓名"
      t.string :phone, comment: "手机号"

      t.timestamps
    end
  end
end
