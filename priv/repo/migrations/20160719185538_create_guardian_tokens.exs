defmodule SessionService.Repo.Migrations.CreateGuardianTokens do
  use Ecto.Migration

  def change do
    create table(:guardian_tokens, primary_key: false) do
      add :jti, :string, primary_key: true
      add :typ, :string
      add :aud, :string
      add :iss, :string
      add :sub, :string
      add :exp, :string
      add :jwt, :string
      add :claims, :string

      timestamps
    end
    create unique_index(:guardian_tokens, [:jti, :aud])
  end
end
