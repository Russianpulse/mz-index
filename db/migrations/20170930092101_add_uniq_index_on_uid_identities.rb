Hanami::Model.migration do
  change do
    add_index :identities, :uid, uniq: true
  end
end
