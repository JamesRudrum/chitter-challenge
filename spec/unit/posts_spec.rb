require 'post'

describe 'Post' do

  describe '.create' do
    it 'creates post' do
      Post.create(chit: 'Test chit 04')

      expect(Post.all).to include 'Test chit 04'
    end
  end

  describe '.all' do
    it 'shows all posts' do
      con = PG.connect :dbname => 'chitter_test'

      con.exec("INSERT INTO posts (chit) VALUES('Test chit 01');")
      con.exec("INSERT INTO posts (chit) VALUES('Test chit 02');")
      con.exec("INSERT INTO posts (chit) VALUES('Test chit 03');")

      posts = Post.all

      expect(posts).to include("Test chit 01")
      expect(posts).to include("Test chit 02")
      expect(posts).to include("Test chit 03")
    end
  end
end
