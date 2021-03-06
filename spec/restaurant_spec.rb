require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new }
  let(:dish_name) {double('a name of dish')}
  let(:price) {double('a price of dish')}
  let(:amount) {double('an amount of dish')}
  let(:total_number) {double('number_of_dishes')}



  context "when created" do
    it "has an empty menu" do
      expect(restaurant.menu).to eq []
    end
  end

  describe '#create_dish' do
    it 'creates dish and adds it to menu' do
      expect {restaurant.create_dish(dish_name, price)}.to change{restaurant.menu.count}.by 1
    end

    it 'checks if the thing added to menu is of class Dish' do
      restaurant.create_dish(dish_name, price)
      expect(restaurant.menu.last).to be_instance_of(Dish)
    end
  end

  describe '#display_menu' do
    it 'displays meny' do
      restaurant.create_dish(dish_name, price)
      expect(restaurant.display_menu).to eq restaurant.menu
    end
  end

  describe '#create_order' do
    it 'creates an order' do
      restaurant.create_dish(dish_name, price)
      expect(restaurant.create_order([{name: dish_name, amount: 1}], 1)).to be_instance_of(Order)
    end
  end

end
