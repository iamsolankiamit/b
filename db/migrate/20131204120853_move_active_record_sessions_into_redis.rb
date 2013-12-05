class MoveActiveRecordSessionsIntoRedis < ActiveRecord::Migration
  def up
  #  old_sessions = ActiveRecord::Base.connection.select_all("select * from sessions where updated_at > '#{Time.now - 1.month}'")

  #  old_sessions.each do |session|

  #    data = ActiveRecord::SessionStore::Session.unmarshal(session["data"])

  #    $redis.setex session["session_id"],
  #      1.month.to_i,
  #      Marshal.dump(data).to_s.force_encoding(Encoding::BINARY)
  #  end
  #  drop_table :sessions
  end

  def down
  #  raise ActiveRecord::IrreversibleMigrations, "Session transffered to redis, reverseback logic not written."
  end
end
