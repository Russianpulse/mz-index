Hanami::Model.migration do
  change do
    create_table :identities do
      primary_key :id

      column :provider, String, null: false
      column :uid, String, null: false

      column :info, File, null: false
      column :extra, File, null: false

      foreign_key :user_id, :users, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
