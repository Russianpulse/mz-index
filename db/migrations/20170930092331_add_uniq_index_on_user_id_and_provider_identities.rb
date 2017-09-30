Hanami::Model.migration do
  change do
    add_index :identities, [:user_id, :provider], uniq: true
  end
end
