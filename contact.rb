
gem 'activerecord', '=4.2.7'
require 'activerecord'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')


class Contact < ActiveRecord::Base

#adding some fields to our table, which will automatically set up reader/writer Methods
#for each of these fields

# below, we are defining our fields, and providing the name of the column as a symbol
# then, we are defining the data type that wil be stored in the field (:string)
field :first_name,  as: :string
field :last_name,   as: :string
field :email,       as: :string
field :note,        as: :text


  def full_name
    # @full_name = @first_name + @last_name
    puts "Hello, my name is #{first_name} #{last_name}"
  end

end

Contact.auto_upgrade!
