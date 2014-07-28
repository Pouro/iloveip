module Jekyll
  class WithinCollectionPostNavigation < Generator
    def generate(site)
      site.collections.each_pair do |label, collection|
        collection.docs.sort! { |a,b| b.data["order"] <=> a.data["order"] }
        collection.docs.group_by{|d| d.data["category"]}.each do |cat, docs|
          docs.each do |doc|
            index = docs.index doc
            next_in_category = nil
            previous_in_category = nil
            if index
              if index < docs.length - 1
                next_in_category = docs[index + 1]
              end
              if index > 0
                previous_in_category = docs[index - 1]
              end
            end
            doc.data["next_in_category"] = next_in_category unless next_in_category.nil?
            doc.data["previous_in_category"] = previous_in_category unless previous_in_category.nil?
          end
        end
      end
    end
  end
end
