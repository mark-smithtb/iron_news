require 'active_record_migrations'
require 'active_record'
require 'pg'

ActiveRecordMigrations.configure do |config|
  config.database_configuration = {
    # 'production' => {
    #   adapter: 'postgresql'
    # },
    'development' => {
      'adapter' => "postgresql",
      'host' => "localhost",
      'username' => "thad",
      'database' => "IronNews"
    },
    'production' => {
      aadapter: "postgresql",
      host: "ec2-54-204-30-115.compute-1.amazonaws.com",
      username: "uyutkfhmslwjeg",
      password: "tRJEbzpytmaygxfM08B1S5XeS1",
      port: "5432",
      database: "d5f61tg1vs61dm"
    }
}
  }
end
    production {
      aadapter: "postgresql",
      host: "ec2-54-204-30-115.compute-1.amazonaws.com",
      username: "uyutkfhmslwjeg",
      password: "tRJEbzpytmaygxfM08B1S5XeS1",
      port: "5432",
      database: "d5f61tg1vs61dm"
    }
}
ActiveRecordMigrations.load_tasks
