require "spec_helper"

require 'active_record'

RSpec.describe ActiveModel::ErrorMessagesWithoutAttributes do
  it "has a version number" do
    expect(ActiveModel::ErrorMessagesWithoutAttributes::VERSION).not_to be nil
  end

  conn = { adapter: 'sqlite3', database: ':memory:' }

  ActiveRecord::Base.establish_connection(conn)

  class User < ActiveRecord::Base
    connection.create_table :users, force: true do |t|
      t.string :first_name, :last_name
      t.timestamps
    end

    validates :first_name,
      :presence => {:message => 'cannot be blank.'},
      :length => {:maximum => 64, :message => '^What are you thinking?'}

    validates :last_name, :presence => true
  end

  it "uses the default message" do
    u = User.new
    u.valid?

    expect(u.errors.full_messages_for(:first_name)).to eq(["First name cannot be blank."])
    expect(u.errors.full_messages_for(:last_name)).to eq(["Last name can't be blank"])
  end

  it "uses the message without attributes" do
    u = User.new(:first_name => 'a'*65)
    u.valid?

    expect(u.errors.full_messages_for(:first_name)).to eq(["What are you thinking?"])
  end
end
