require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "should filter products by name" do
    assert_equal 2, Product.filter_by_title("tv").count
  end

  test "should filter products by name and sort them " do
    assert_equal [products(:another_tv), products(:one)],
                 Product.filter_by_title("tv").sort
  end

  test "should filter product by price and sort them" do
    assert_equal [products(:two), products(:one)],
                 Product.above_or_equal_to_price(200).sort
  end

  test "should sort product by most recent" do
    products(:two).touch
    assert_equal [products(:another_tv), products(:one), products(:two)],
                 Product.recent.to_a
  end

  test "search should not find videogame and 100 as min price" do
    search_hash = { keyword: "videogame", min_price: 100 }
    assert_equal Product.search(search_hash).empty?
  end
end
