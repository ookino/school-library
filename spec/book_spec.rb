require_relative '../book.rb'

describe Book do
  context "when testing the book class" do
    before (:each) do
      @books = Book.new('Harry Potter', 'J.K Rowling')
    end

    it "should return the correct book author" do
      expect(@books.author).to eq 'J.K Rowling'
    end

    it "should return the correct book title" do
      expect(@books.title).to eq 'Harry Potter'
    end
  end
end