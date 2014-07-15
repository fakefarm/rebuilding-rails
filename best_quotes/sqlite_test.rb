require 'sqlite3'
require 'rulers/sqlite_model'

class MyTable < Rulers::Model::SQLite; end
STDERR.puts MyTable.schema.inspect
