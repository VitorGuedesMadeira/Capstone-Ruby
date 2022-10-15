class Archived
  def self.list_can_be_archived(things, archived_things)
    index = 1
    puts "\nTHINGS OLDER THAN 10 YEARS:"
    things.each do |thing|
      thing.move_to_archive
      if thing.archived
        puts "#{index}) [#{thing.class}] #{thing.label.title} (ID: #{thing.id}) - can be archived"
        index += 1
      end
    end
    puts "\nDo you want to archive an item?"
    puts '1) Yes'
    puts '2) No'
    print 'Answer: '
    case_answer(gets.chomp, things, archived_things)
  end

  def self.case_answer(ans, things, archived_things)
    case ans.downcase
    when '1', 'yes'
      archive_an_item(things, archived_things)
    when '2', 'no'
      puts 'Back to the menu!'
    else
      puts 'Invalid input!'
    end
  end

  def self.archive_an_item(things, archived_things)
    puts "\nPlease, select an item by its ID"
    print 'Answer: '
    item_selected = gets.chomp
    item_to_be_archived = things.find { |thing| thing.id == item_selected.to_i }
    archived_things << item_to_be_archived
    things.delete_if { |thing| thing.id == item_selected.to_i }
  end

  def self.list_archived_items(archived_things)
    archived_things.each_with_index do |thing, index|
      puts "#{index + 1}) [#{thing.class}] #{thing.label.title} (ID: #{thing.id}) - archived"
    end
  end
end
