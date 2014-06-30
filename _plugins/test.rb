module Jekyll
  class WithinCollectionPostNavigation < Generator
    def generate(site)
      site.collections.each_pair do |label, collection|
        collection.docs.sort! { |a,b| b <=> a}
        collection.docs.each do |docs|
          index = collection.docs.index docs
          next_in_category = nil
          previous_in_category = nil
          if index
            if index < collection.docs.length - 1
              next_in_category = collection.docs[index + 1]
            end
            if index > 0
              previous_in_category = collection.docs[index - 1]
            end
          end
          docs.data["next_in_category"] = next_in_category unless next_in_category.nil?
          docs.data["previous_in_category"] = previous_in_category unless previous_in_category.nil?
        end
      end
    end
  end
end
