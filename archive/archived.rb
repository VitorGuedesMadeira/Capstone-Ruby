class Archived
  def self.list_can_be_archived(things)
    index = 1
    puts "\nTHINGS OLDER THAN 10 YEARS:"
    things.each do |thing|
      thing.move_to_archive
      if thing.archived
        puts "[#{index}] #{thing.label.title} - can be archived"
        index += 1
      end
    end
  end
end
