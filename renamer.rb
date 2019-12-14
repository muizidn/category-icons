items = Dir["/Users/muis/Downloads/Mobile Apps Icon copy/*.png"]
zipped = [
  [1, "Clothes"],
  [2, "Women Clothes"],
  [3, "Jewelry"],
  [5, "Women Jewelry"],
  [13, "Shoes"],
  [15, "Sandals"],
  [17, "Loafers"],
  [20, "Heels & Pumps"],
  [21, "Boots"],
  [26, "Slippers"],
  [27, "Sneakers"],
  [29, "Flats"],
  [30, "Mules & Clogs"],
  [32, "Wedges"],
  [35, "Baby"],
  [36, "Diapering"],
  [41, "Gear & Activity"],
  [63, "Nursing & Feeding"],
  [87, "Toddler Shoes"],
  [94, "Electronics"],
  [98, "Speakers & Audio Systems"],
  [113, "Holiday Shop"],
  [114, "Halloween"],
  [119, "Christmas"],
  [139, "Men"],
  [196, "Toys"],
  [197, "Bikes"],
  [199, "Dress Up & Pretended Play"],
  [202, "Kids Arts & Crafts"],
  [204, "Games & Puzzlez"],
  [206, "Dolls"],
  [208, "Outdoor Toys"],
  [214, "Action Figures & Playsets"],
  [221, "Building Sets & Blocks"],
  [227, "Scooters & Skateboards & Skates"],
  [229, "Learning Toys"],
  [232, "Stuffed Animals & Plush Toys"],
  [233, "Collectors Toys"],
  [244, "Vehicles & Remote Control"],
  [257, "Toys"],
  [258, "Lego"],
  [298, "Apparel & Accessories"],
  [299, "Baby"],
  [309, "Clothing"],
  [516, "Men"],
  [517, "Apparel"],
  [519, "Women"],
  [520, "Shoes"],
  [617, "Baby Girl"],
  [632, "Toys"],
  [634, "Action Figures Statues"],
  [641, "Arts Crafts"],
  [672, "Baby Toddler Toys"],
  [688, "Building Toys"],
  [692, "Dolls Accessories"],
  [697, "Dress Up Pretend Play"],
  [704, "Games"],
  [716, "Grown Up Toys"],
  [720, "Hobbies"],
  [728, "Kids Electronics"],
  [734, "Kids Furniture Decor Storage"],
  [740, "Learning Education"],
  [749, "Watches"],
  [750, "Pocket Watches"],
  [751, "Smartwatches"],
  [752, "Watch Bands"],
  [753, "Wrist Watches"],
  [754, "Pet Supplies"],
  [755, "Dogs"],
  [845, "Bags"],
  [879, "Accessories & Bags"],
  [894, "Bags"],
  [902, "Men"],
  [903, "Clothing"],
  [925, "Women"],
  [940, "Shoes"],
  [997, "Aldo"],
  [1018, "Hats"],
  [1020, "Wallets"],
  [1022, "Bracelets"],
  [1037, "Adidas"],
  [1038, "Armani"],
  [1039, "Balenciaga"],
  [1040, "Bally"],
  [1041, "BCBG"],
  [1042, "Bebe"],
  [1043, "Bottega Venetta"],
  [1044, "Burberry"],
  [1045, "Calvin Klein"],
  [1046, "Carrera"],
  [1047, "Celine"],
  [1048, "Champion"],
  [1049, "Converse"],
  [1050, "Diesel"],
  [1051, "Dyson"],
  [1052, "Ecovacs"],
  [1053, "Estee Lauder"],
  [1054, "Fendi"],
  [1055, "Furla"],
  [1056, "Gucci"],
  [1057, "Herschel Supply Co."],
  [1058, "Hugo Boss"],
  [1059, "Jessica Simpson"],
  [1060, "Juicy Couture"],
  [1061, "Karl Lagerfeld"],
  [1062, "Kate Spade"],
  [1063, "Keds"],
  [1064, "Kenneth Cole"],
  [1065, "Kenzo"],
  [1066, "Longchamp"],
  [1067, "Marc Jacobs"],
  [1068, "MCM"],
  [1069, "Michael Kors"],
  [1070, "Moncler"],
  [1071, "Movado"],
  [1072, "Nine West"],
  [1073, "Prada"],
  [1074, "Rebecca Minkoff"],
  [1075, "Roberto Cavalli"],
  [1076, "Roomba"],
  [1078, "Salvatore Ferragamo"],
  [1079, "Samsonite"],
  [1080, "Skechers"],
  [1081, "Tadashi Shoji"],
  [1082, "Ted Baker"],
  [1083, "Timberland"],
  [1084, "Tory Burch"],
  [1085, "True Religion"],
  [1086, "Tumi"],
  [1087, "UGG"],
  [1088, "Under Armour"],
  [1089, "Versace"],
  [1090, "Vince Camuto"],
  [1091, "Samsung"],
  [1092, "Bvlgari"],
  [1093, "Saint Laurent"],
  [1094, "Baby Boy"],
  [1095, "Shoes"],
  [1096, "Raymond Weil"],
  [1097, "Bulova"],
  [1098, "Citizen"],
  [1099, "Casio"],
  [1100, "Tommy Bahama"],
  [1101, "Invicta"],
  [1102, "Versus Versace"],
  [1103, "Badgley Mischka"],
  [1104, "Anne Klein New York"],
  [1105, "Handbags"],
  [1108, "Headphones"],
  [1112, "Electronics"],
  [1113, "Accessories & Supplies"],
  [1153, "Car & Vehicle Electronics"]
]

zipped.each do |z| 
  File.open("/Users/muis/Downloads/Mobile Apps Icon copy/zipped.txt", 'a') { |file| file.write("#{z.to_s}\n") }
end

items.each do |i|
  o = i.clone
  i.gsub!("-", " ")
  File.rename(o,i)
end

newURLs = {}
notMapped = []

loginfo = []

zipped.each do |i|
   id = i[0]
   name = i[1]
   puts "Working for #{name}"

   key = items.select do |k| 
     k.sub!("-", " ")
     k.downcase.include? name.downcase
   end
   if key.any?
     value = File.dirname(key.first) + "/#{id}.png"
     newURLs[key.first] = value
   else 
     notMapped.push name
   end
end

newURLs.each do |k,v|
  File.rename(k.to_s,v.to_s)
  loginfo.push "#{k.to_s} => #{v.to_s}"
end

loginfo.each do |l| 
  File.open("/Users/muis/Downloads/Mobile Apps Icon copy/loginfo.log", 'a') { |file| file.write("#{l.to_s}\n") }
end

