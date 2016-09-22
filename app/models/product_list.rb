class ProductList < ActiveRecord::Base
    def filter_by(category, trademark)
      search= Product.search do
       all_of do
         with(:category_id, category.id)
         with(:trademark_id, trademark.id)
       end
      end
      return search.results
    end

    def order_by(option, category, trademark)
      search= Product.search do
         all_of do
           with(:category_id, category.id)
           with(:trademark_id, trademark.id) unless trademark.nil?
         end
         if option == 'Menor precio'
           order_by :price, :asc
         elsif option =='Mayor precio'
           order_by :price, :desc
        end
      end
      return search.results
    end      
end
