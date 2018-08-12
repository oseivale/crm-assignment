
gem 'activerecord', '=4.2.7'
require 'activerecord'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')


class Contact
  attr_accessor :first_name, :last_name, :email, :note
  # This method should initialize the contact's attributes

  @@contacts = []
  @@id = 1


  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact

  end





  # This method should return all of the existing contacts
  def self.all
    return @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@id = id
    return @@id
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update_first_name(new_first_name)
    @first_name = new_first_name
  end

  def update_last_name(new_last_name)
    @last_name = new_last_name
  end

  def update_email(new_email)
    @email = new_email
  end

  def update_note(new_note)
    @note = new_note
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @@contacts.each do |contact|
      if contact.first_name == @first_name
        return @first_name
      elsif
        contact.last_name == @last_name
        return @last_name
      elsif
        contact.email == @email
        return @email
      elsif
        contact.note == @note
        return @note
      end
    end

  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
    return @@contacts
  end

  def full_name
    # @full_name = @first_name + @last_name
    puts "Hello, my name is #{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(contact)
    contact = Contact.new(first_name, last_name, email, note)
    return contact.delete
  end

  # Feel free to add other methods here, if you need them.

end

#testing code to make a new contact

val = Contact.new('Val', 'Osei', 'valerie.osei@gmail.com', 'You are awesome!')
tom = Contact.new('Tom', 'Murphy', 'tom.murphy@gmail.com', 'Super cool dude!')
sally = Contact.new('Sally', 'Richardson', 'sally_richards@gmail.com', 'Hockey player!')
dave = Contact.new('Dave', 'Thomas', 'dave.thomas@gmail.com', 'Has 6 cats!')


p val.email
val.note = "I love icecream!"

# p val
# p tom
# p sally
# p dave


val = Contact.create('Val', 'Osei', 'valerie.osei@gmail.com', 'You are awesome!')
tom = Contact.create('Tom', 'Murphy', 'tom.murphy@gmail.com', 'Super cool dude!')
sally = Contact.create('Sally', 'Richardson', 'sally_richards@gmail.com', 'Hockey player!')
dave = Contact.create('Dave', 'Thomas', 'dave.thomas@gmail.com', 'Has 6 cats!')

# p val
# p tom
# p sally
# p dave

p Contact.all
p Contact.find(8)

p Contact.find_by('Val', 'Osei', 'valerie.osei@gmail.com', 'You are awesome!')

p tom.update_email('valerie.osei@gmail.com')

p tom

p Contact.delete_all

p sally.full_name

p tom.delete(tom)
