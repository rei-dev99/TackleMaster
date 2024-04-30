services:
  db:
    image: postgres
    restart: always
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
    volumes:
      - postgresql_data:/var/lib/postgresql
  web:
    build: .
    command: bash -c "bundle install && bundle exec rails db:prepare && rm -f tmp/pids/server.pid && ./bin/dev"
    depends_on:
      - db
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password

    volumes:
      - .:/TackleMaster
    ports:
      - "3000:3000"
    restart: always # コンテナが停止すると常に再起動
volumes:
  postgresql_data:
