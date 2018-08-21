require_relative "../lib/shoe.rb"
require_relative "../lib/store.rb"

kith = Store.create(name:"Kith",location:"Brooklyn",hours:"11am-7pm",specialty:"Off-White")
extra_butter = Store.create(name:"Extra Butter",location:"Manhattan",hours:"10am-8pm",specialty:"Yeezy")
jimmy_jazz = Store.create(name:"Jimmy Jazz",location:"Queens",hours:"11am-7pm",specialty:"Converse")
sneaker_bar = Store.create(name:"Sneaker Bar",location:"Bronx",hours:"11am-7pm",specialty:"Jordan")
champs = Store.create(name:"Champs",location:"Staten Island",hours:"9am-9pm",specialty:"Ultraboost")
nike_lab = Store.create(name:"Nike Lab",location:"Manhattan",hours:"11am-7pm",specialty:"Air Max")

raptors = Shoe.create(size:13,color:"Black/Purple/Red",brand:"Nike",item_id:"AQ3816-065",model:"Jordan 4",style:"Basketball",msrp:200)
sesame = Shoe.create(size:10,color:"Sesame/Gum",brand:"Adidas",item_id:"F99710",model:"Yeezy Boost 350 V2",style:"Lifestyle",msrp:220)
cdg = Shoe.create(size:7,color:"Black/White/Red",brand:"Converse",item_id:"1127818",model:"Comme des Garcons x Converse Chuck Taylor",style:"Lifestyle",msrp:135)
presto = Shoe.create(size:9,color:"Black/White/Cone",brand:"Nike",item_id:"AA3830-002",model:"Air Presto Off-White",style:"Running",msrp:160)
anniversary = Shoe.create(size:12,color:"White/Red/Gray/Black",brand:"Nike",item_id:"908375-103",model:"Air Max 1 Anniversary",style:"Lifestyle",msrp:140)
ultraboost = Shoe.create(size:8,color:"Black",brand:"Adidas",item_id:"BB6171",model:"Ultraboost 4.0",style:"Running",msrp:200)
