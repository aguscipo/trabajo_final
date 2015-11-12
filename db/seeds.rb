User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

n=0

Product.create :name => 'Notebook HP Pavilion 15-AK001la', :description => 'Pantalla de 15.6" - Core i5 - Memoria de 8 GB - Disco duro de 1 TB - Color Negro', :price => 0, :stock => 10, :code => n+=1, :category => 'Categoria', :trademark => 'Marca', :picture => open('app/assets/images/notebook-hp.jpg')
Product.create :name => 'Notebook Dell INSPIRON 14-5458', :description => 'Pantalla de 14" - Intel Core i3 - Memoria de 4 GB - Disco duro de 1 TB - Color Blanco', :price => 9000, :stock => 10, :code => n+=1, :category => 'Notebook', :trademark => 'Dell', :picture => open('app/assets/images/notebook-dell.jpg')
Product.create :name => 'Tablet Apple iPad Mini 4', :description => 'Wi-Fi 16 GB - Color Space Gray', :price => 8000, :stock => 5, :code => n+=1, :category => 'Tablet', :trademark => 'Apple', :picture => open('app/assets/images/tablet-ipad.jpg')
Product.create :name => 'Cámara Sony W800', :description => '20.1 megapixels - Color Negro', :price => 1600, :stock => 6, :code => n+=1, :category => 'Camara', :trademark => 'Sony', :picture => open('app/assets/images/camara-sony.jpg')
Product.create :name => 'Cámara Fujifilm JX660', :description => '16 megapixels - Color Rojo', :price => 1200, :stock => 15, :code => n+=1, :category => 'Camara', :trademark => 'Fujilm', :picture => open('app/assets/images/camara-fujilm.jpg')

