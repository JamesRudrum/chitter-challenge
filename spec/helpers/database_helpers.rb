require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM posts WHERE id = #{id};")
  result.first
end

def persisted_data_2(id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM users WHERE id = #{id};")
  result.first
end
