class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      ## Devise 用
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## 独自追加カラム
      t.string :name, null: false
      t.text :profile, null: false
      t.text :occupation, null: false
      t.text :position, null: false

      t.timestamps
    end

    ## Devise用インデックス
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end