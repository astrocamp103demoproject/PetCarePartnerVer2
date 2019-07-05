file = File.open("address_six_country_test.txt")
array = JSON.parse(file.read)

# township_array =  ["臺北市中正區","臺北市大同區","臺北市中山區","臺北市松山區","臺北市大安區","臺北市萬華區","臺北市信義區","臺北市士林區","臺北市北投區","臺北市內湖區"]
# array.each do |address_six_country| 
#0-247
pic_array = ["animal-214715_640.jpg","animal-272473_640.jpg","animal-339400_640.jpg","animalia-3208412_640.jpg","animals-2775048_640.jpg","animals-2939742_640.jpg","animals-2939753_640.jpg","animals-4253238_640.jpg","apartment-1851201_640.jpg","armchair-2608761_640.jpg","background-3124573_640.jpg","bordeaux-868991_640.jpg","bordeaux-869020_640.jpg","bordeaux-869028_640.jpg","bordeaux-869029_640.jpg","bordeaux-869038_640.jpg","boxer-1562522_640.jpg","brick-wall-1850095_640.jpg","british-2105411_640.jpg","british-2105415_640.jpg","bulldog-1047518_640.jpg","cat-1021602_640.jpg","cat-1044914_640.jpg","cat-1083426_640.jpg","cat-1088899_640.jpg","cat-1170556_640.jpg","cat-1186532_640.jpg","cat-1192026_640.jpg","cat-140305_640.jpg","cat-1542857_640.jpg","cat-1548174_640.jpg","cat-1649082_640.jpg","cat-1649955_640.jpg","cat-1692384_640.jpg","cat-1779778_640.jpg","cat-1779781_640.jpg","cat-1779788_640.jpg","cat-179738_640.jpg","cat-179841_640.jpg","cat-179842_640.jpg","cat-1818927_640.jpg","cat-1903024_640.jpg","cat-2095559_640.jpg","cat-2265242_640.jpg","cat-2358299_640.jpg","cat-2367564_640.jpg","cat-2377823_640.jpg","cat-2383265_640.jpg","cat-2403296_640.jpg","cat-2432996_640.jpg","cat-2437945_640.jpg","cat-2438081_640.jpg","cat-2438085_640.jpg","cat-2438092_640.jpg","cat-2438095_640.jpg","cat-2453009_640.jpg","cat-2486087_640.jpg","cat-2520988_640.jpg","cat-2682112_640.jpg","cat-2760791_640.jpg","cat-2851569_640.jpg","cat-2858202_640.jpg","cat-2858293_640.jpg","cat-2966064_640.jpg","cat-2968569_640.jpg","cat-3076495_640.jpg","cat-3091352_640.jpg","cat-3195117_640.jpg","cat-3195119_640.jpg","cat-3204836_640.jpg","cat-323262_640.jpg","cat-3261093_640.jpg","cat-3308057_640.jpg","cat-3396800_640.jpg","cat-3396813_640.jpg","cat-3397139_640.jpg","cat-3416713_640.jpg","cat-3442258_640.jpg","cat-3552143_640.jpg","cat-3759352_640.jpg","cat-3799148_640.jpg","cat-3833949_640.jpg","cat-3886464_640.jpg","cat-4016308_640.jpg","cat-4018722_640.jpg","cat-4019862_640.jpg","cat-4047348_640.jpg","cat-4053656_640.jpg","cat-4053775_640.jpg","cat-4074330_640.jpg","cat-4088920_640.jpg","cat-4112757_640.jpg","cat-4119616_640.jpg","cat-4119621_640.jpg","cat-4146401_640.jpg","cat-4146405_640.jpg","cat-4199084_640.jpg","cat-4212770_640.jpg","cat-4229769_640.jpg","cat-4236237_640.jpg","cat-4267163_640.jpg","cat-4313953_640.jpg","cat-659426_640.jpg","cat-691532_640.jpg","cat-694730_640.jpg","cat-791141_640.jpg","cat-944033_640.jpg","child-3861296_640.jpg","colorful-1340664_640.jpg","contemporary-3077021_640.jpg","cottage-223908_640.jpg","couch-1213103_640.jpg","cute-3118069_640.jpg","cute-3165954_640.jpg","cute-3252248_640.jpg","cute-3252251_640.jpg","cute-3252459_640.jpg","cute-3269715_640.jpg","cute-3299634_640.jpg","dog-1123016_640.jpg","dog-1150055_640.jpg","dog-1151195_640.jpg","dog-1224267_640.jpg","dog-1861839_640.jpg","dog-1966393_640.jpg","dog-1966394_640.jpg","dog-2037648_640.jpg","dog-2511211_640.jpg","dog-2579871_640.jpg","dog-2579874_640.jpg","dog-2579885_640.jpg","dog-2590819_640.jpg","dog-2645627_640.jpg","dog-2785077_640.jpg","dog-2911444_640.jpg","dog-3056131_640.jpg","dog-3123368_640.jpg","dog-3148967_640.jpg","dog-3190143_640.jpg","dog-3438453_640.jpg","dog-3619020_640.jpg","dog-3619584_640.jpg","dog-3784758_640.jpg","dog-3849781_640.jpg","dog-4019769_640.jpg","dog-4055783_640.jpg","dog-4203453_640.jpg","dog-4220088_640.jpg","dog-926220_640.jpg","dog-994707_640.jpg","dog-994709_640.jpg","dog-samoyed-2530300_640.jpg","exterior-1597094_640.jpg","eyes-943122_640.jpg","friends-1149841_640.jpg","furniture-2439944_640.jpg","gata-4278730_640.jpg","george-eastman-house-70173_640.jpg","holiday-house-177401_640.jpg","home-1438305_640.jpg","home-1680800_640.jpg","home-1746518_640.jpg","home-3625018_640.jpg","home-3678961_640.jpg","house-2570494_640.jpg","house-2590083_640.jpg","house-2606823_640.jpg","house-2608548_640.jpg","house-3121253_640.jpg","house-3362676_640.jpg","house-961401_640.jpg","htc.jpg","interior-1961070_640.jpg","interior-2685521_640.jpg","interior-647613_640.jpg","japanese-2046171_640.jpg","kitchen-1336160_640.jpg","kitchen-2165756_640.jpg","kitchen-2400367_640.jpg","kitchen-347315_640.jpg","kitten-3516381_640.jpg","kitten-3617838_640.jpg","kitten-3644941_640.jpg","kitten-3790707_640.jpg","kitten-4047131_640.jpg","kitten-757844_640.jpg","kitty-551554_640.jpg","living-room-162674_640.jpg","living-room-1952072_640.jpg","living-room-2569325_640.jpg","living-room-2732939_640.jpg","living-room-389264_640.jpg","luxury-home-2409518_640.jpg","malinois-3331687_640.jpg","middle_htc.jpg","middle_piccollage01.jpg","middle_piccollage03.jpg","nature-3339455_640.jpg","neighborhood-802074_640.jpg","nursery-1078923_640.jpg","p-01.jpeg","p-02.jpeg","p-03.jpeg","p-04.jpeg","p-05.jpeg","p-06.jpeg","p-07.jpeg","p-08.jpeg","p-09.jpeg","p-10.jpeg","p-11.jpeg","p-12.jpeg","p-13.jpeg","p-14.jpeg","p-15.jpeg","p-16.jpg","p-17.jpg","people-4205751_640.jpg","person-1926761_640.jpg","pet-1933158_640.jpg","piccollage01.jpg","piccollage03.jpg","pig-3033965_640.jpg","pig-3969463_640.jpg","pillow-706176_640.jpg","pug-690566_640.jpg","puppy-2592307_640.jpg","rec-room-802017_640.jpg","red-840058_640.jpg","rocking-chair-349689_640.jpg","rottweiler-869007_640.jpg","rottweiler-869009_640.jpg","rottweiler-869012_640.jpg","rottweiler-869013_640.jpg","rottweiler-869018_640.jpg","sofa-184555_640.jpg","spinner-2663796_640.jpg","spitz-2095717_640.jpg","squirrel-4305042_640.jpg","summer-2448878_640.jpg","tabby-114782_640.jpg","table-3976625_640.jpg","thumb_htc.jpg","thumb_piccollage01.jpg","thumb_piccollage03.jpg","victorian-home-1606836_640.jpg","welsh-corgi-3097215_640.jpg","wood-fibre-boards-3065087_640.jpg"]
# url = "https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/uploads/picture/pic/for-seed/"

1.times { 
#     #sitter
    name = Faker::Name.unique.name
    email = name.split(' ')
    slogan = Faker::TvShows::GameOfThrones.quote
    price = Faker::Number.number(3)
    # avatar = "https://i.pravatar.cc/300?img=#{rand(1..50)}"
    number = rand(0..9)
    pet_limit = rand(1..5)
    square_meters = rand(20..50)
    pic_mount = rand(10..20)
    avatar = rand(1..66)
    address = rand(0..5)
    #建立保母 25~33
    puts "."
    user = User.create(name: name ,avatar: "avatar"+avatar.to_s+".jpg", email: email[0].downcase+"@example.com", password: '123456', address:array[address],role: 'sitter')
    # binding.pry
    puts "."
    Sitter.create(name: name ,avatar: "avatar"+avatar.to_s+".jpg", email: email[0].downcase+"@example.com", password: '123456', slogan:slogan, address:array[address], price:price, pet_limit: pet_limit,square_meters: square_meters)
    puts "."
    pic_mount.times{
        pic = rand(1..239)       
        Picture.create(pic: "photo"+pic.to_s+".jpg",user_id: user.id)
    }
    puts "."
    #建立使用者用這條
    # user = User.create(name: name ,avatar: "avatar"+avatar.to_s+".jpg", email: email[0].downcase+"@example.com", password: '123456', address:array[address])
}
# end

# 1.times { 
#     #sitter
#     email = Faker::Internet.email
#     name = Faker::Name.unique.name
#     slogan = Faker::TvShows::GameOfThrones.quote

#     price = Faker::Number.number(3)
#     avatar = "https://api.adorable.io/avatars/285/#{Faker::Alphanumeric.alpha 5}@adorable.io.png"
#     pic = "https://picsum.photos/300/300"
#     number = rand(0..9)


#     Sitter.create(avatar: avatar, name: name ,email: email, password: '123456', slogan:slogan, address:township_array[number], price:price, pet_limit: '3', pic: pic,square_meters: number)
# }

