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

n=0 #Codigo del producto (se va incrementando)

#Categorias
notebook=Category.create :name => 'Notebook'
tablet=Category.create :name => 'Tablet'
camara=Category.create :name => 'Camara'
allInOne=Category.create :name => 'All in one'


#Marcas
dell=Trademark.create :name => 'Dell'
hp=Trademark.create :name => 'HP'
apple=Trademark.create :name => 'Apple'
sony=Trademark.create :name => 'Sony'
fujifilm=Trademark.create :name => 'Fujifilm'


#Productos
p1=Product.create :name => 'Notebook HP Pavilion 15-AK001la', :description => 'Pantalla de 15.6" - Core i5 - Memoria de 8 GB - Disco duro de 1 TB - Color Negro', :price => 10000, :stock => 10, :code => n+=1, :picture => open('app/assets/images/notebook-hp.jpg'), :offer => false
p1.update(trademark:hp)
notebook.products << p1

p2=Product.create :name => 'Notebook Dell INSPIRON 14-5458', :description => 'Pantalla de 14" - Intel Core i3 - Memoria de 4 GB - Disco duro de 1 TB - Color Blanco', :price => 9000, :stock => 10, :code => n+=1,:picture => open('app/assets/images/notebook-dell.jpg'), :offer => false
p2.update(trademark:dell)
notebook.products << p2

p3=Product.create :name => 'Tablet Apple iPad Mini 4', :description => 'Wi-Fi 16 GB - Color Space Gray', :price => 8000, :stock => 5, :code => n+=1, :picture => open('app/assets/images/tablet-ipad.jpg'), :offer => false
p3.update(trademark:apple)
tablet.products << p3

p4=Product.create :name => 'Cámara Sony W800', :description => '20.1 megapixels - Color Negro', :price => 1600, :stock => 6, :code => n+=1, :picture => open('app/assets/images/camara-sony.jpg'), :offer => false
p4.update(trademark:sony)
camara.products << p4

p5=Product.create :name => 'Cámara Fujifilm JX660', :description => '16 megapixels - Color Rojo', :price => 1200, :stock => 15, :code => n+=1, :picture => open('app/assets/images/camara-fujilm.jpg'), :offer => false
p5.update(trademark:fujifilm)
camara.products << p5

p6=Product.create :name => 'Tablet HP ElitePad 900', :description => 'Pantalla 10.1" - Camara 8 MP - Almacenamiento 64 GB - Windows 8', :price => 6879, :code => n+=1, :stock => 15, :picture => open('app/assets/images/tablet-hp.jpg'), :offer => true, :cover_picture => open('app/assets/images/tablet-hp-cover.png')
p6.update(trademark:hp)
tablet.products << p6

p7=Product.create :name => 'All in One HP 5001', :description => ' Procesador Intel Core i5-4570T - 4 GB ampliable a 16 GB - Disco duro de 1TB - Windows 8.1', :price => 5204, :code => n+=1, :stock => 5, :picture => open('app/assets/images/all-in-one-hp.png'), :offer => true, :cover_picture => open('app/assets/images/all-in-one-hp-cover.png')
p7.update(trademark:hp)
allInOne.products << p7
