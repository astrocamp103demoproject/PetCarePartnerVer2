module FindAvatarHelper
    def find_avatar(id)
        avatar_url_arr = ["https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-01.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-02.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-03.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-04.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-05.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-06.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-07.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-08.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-09.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-10.jpeg",
                          "https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-11.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-12.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-13.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-14.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-15.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-16.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-17.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-18.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-19.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-20.jpeg",
                          "https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-21.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-22.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-23.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-24.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-25.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-26.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-27.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-28.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-29.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-30.jpeg",
                          "https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-31.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-32.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-33.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-34.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-35.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-36.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-37.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-38.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-39.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-40.jpeg",
                          "https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-41.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-42.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-43.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-44.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-45.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-46.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-47.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-48.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-49.jpeg","https://5x-pet-collage.s3-ap-northeast-1.amazonaws.com/seed/avatar/300-50.jpeg",
                        ]
        if (id <= 50)
            return avatar_url_arr[id-1]
        elsif (id > 50 && id < 100)
            #51~ 99
            return avatar_url_arr[id-51]
        elsif (id > 99 && id < 150)
            #100~ 149
            return avatar_url_arr[id-100]
        elsif(id > 149 && id < 200)
            #150~199
            return avatar_url_arr[id-150]
        elsif(id > 199 && id < 250)
            return avatar_url_arr[id-200]
        elsif(id > 249 && id < 300)
            return avatar_url_arr[id-250]
        elsif(id > 299 && id < 350)
            return avatar_url_arr[id-300]
        elsif(id > 349 && id < 400)
            return avatar_url_arr[id-350]
        elsif(id > 399 && id < 450)
            return avatar_url_arr[id-400]
        elsif(id > 449 && id < 500)
            return avatar_url_arr[id-450]
        end
        
    end
end