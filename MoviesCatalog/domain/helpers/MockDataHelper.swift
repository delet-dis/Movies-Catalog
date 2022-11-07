//
//  MockDataHelper.swift
//  MoviesCatalog
//
//  Created by Igor Efimov on 19.10.2022.
//

import Foundation

class MockDataHelper {
    static func getGenre() -> Genre {
        Genre(id: UUID().uuidString, name: "комедия")
    }

    static func getShortReview() -> ShortReview {
        ShortReview(id: UUID().uuidString, rating: 5)
    }

    static func getMovie() -> Movie {
        Movie(
            id: UUID().uuidString,
            name: "Форрест Гамп",
            // swiftlint:disable:next line_length
            poster: "https://kinopoisk-ru.clstorage.net/2s89R4K04/ae7af5CslCkK/rVSfH-4xE1g5HfOmBLXTnYX760KasO5cqWbK3B1pm2sMSA_4-9cDU2J9hILb0A-BVRoJJrv1hbU_mgGRzTDtL-xEuu7KtEMt2JlGg3GApywQG9-WLjWKHXhTH2nvmpnoLt8tmwlVAZV2GaBjrmW65VEvrNKLZBHBGLxltulXGEjeZQyN6LKjW4zc8XW0pBFpNYkpdOlDvJgpZVmeXujK-72Nrhm51yNFF5qQRX7HmmajT54ziwJAkeudULbYRykJ3uRdDiqxUWkt3rKUBATiuic4-Tbr4O6LaRbofZ14aIguX5_oexViJqbqAQfuVmglAs7cIvmCIeKrvXPXWHZq6I6kfAxZ8GF5Ta9SNjXlQ5hGKThGiEOfiRmk6M9uOykYjj7Nurj30UbEeGBl_CeqtgM9DuLrMdPDat0AFGrFSzruxM9c6INBae5_Mva0pZL5BzvahHvDrJiJdkl-DWhqeqw-_Urr9CPnxvtDty20e6bQjF5TWyICgJocwMT7R3rYjObPf5uAwenujHAX9gbCuBU5a1SbUy5pKRVKvJ6oC7t8rHzraVYTF0Xbk6cd97qncl_egKnwgkNLHoDFWqZaesy2Dqw4o1C7zpzQt_W18zuHiYrVC9LfqytnKsxe6gkY_s4t6xhnEyfWC-GFr7f7pwGszTPZIlFg2W4Rdyn3aAgcVg4c-cJTm05tQyXUloCrhUlI9unQT1toROsOPQoYuh_MHSirReIWF0jCt4_2iJVjb3yQ6TLAk8hd4MRrVSqoHEYPrnrhM6pvbNLUt4SDCzQ5GYdIc487aXUqzrx5motcPb8qq5eT9vRok2bvh_uVUqxtEymhsoJZvxAUKpSKqk8VvC9IUyBpbU1Q9_TX8Dg0OZinCGGem2inSb4euGrpTL7MKgpFMkbH--ElXOV6FtMv3CIp8pHga-4S5IsU2Jpshtzc63FBif1eE8XWZLFqVEuZJXvznYhJxLreXNvIu34Ovlhbl0Bm91iTl-yEuzfTDU5yGPPAIgndo0fZBMianXUtXoiQ07itztC3ZkTgqvcqOqbIgD0Km-XKrG1ZS2kOj_7ImNXjxseKQwV9pcj2kRx8EQpQY4Fqf3KGytYbO9yknWwas3B7_rwjxJYVU3lGS3pEmhLvCzlnCl1s65lrfB_tGFunMyXEWvOW3pe4VTJtr1EbYtOQq40iNRh0KXr9Bg0cGDDB6a5-szRlhtG6JknpBsrQn7g7xBufvXp6u19dfSgJZ-Ck5hgAZx_2K3dg3j6xeRIjYsnNQsca13iqjoX-zZgTU1u_nXI0BYfTi5Xam6dp0P96ObUKjcwbi6jv7d9KSmRQdzT4E9Qutasm8t_cEDswMELK33MGe-TIuR60Xp1KgZC4XRxA97Wk4ijlWik1CIHMadhUuv6MeYvpT4z9WrpXQhdlGKO1zDeKpKIO3VE7QiACW51gpzrHaMhdhs9sOGOwC12ccMdExfCpJcn5lXtAbkhYtgrsnip62B3e_irbJ8KX1Dpjdl-WSQezXizB6aDjcXldU5QKNykK_DY8fUgS8AhPHJGXtLehulabeQcqgu-ZKUbqzo7r2puef94LO6RDJ3ZJwTQ8tIg3MxzcsPiwImPLjMLFKDV7Ge9nnIzIIQP4Pd9DZXWX8Os3u1iG2oHfCGkFWVwe2nnKLK5fqQnl0kd2KAPW7sWYFfDsThPpkLLDOA7SNxjkKFmsd7zf-1PieS6vcRd3poC4VBq5FUohLZoLVph-X8hKW6xeXai7BgGlVymAdV60qhbgrf_haRHgkhu-ApX5V2rrH5RsH0gxcCptPtA3t8fRajZbCJTrwBy7W8bZDGxJe5r-Po1LOteDFuZoQGZNtTsHwD5OgwtwwjKpPqEnyTaqSZ4FnF3ZUpC4nt0hhpSF0XkVaxoVy-BMmQhEeO9Me9h5vAxsKJmH4Ja2apHUD7U5hVNN32P54eHC2n3Td1q0-PguVD1sqUHjqj6_4xYld_KLhVlq1-vxv4qJJ1jO3_lbW0_Nn3urNyOGp9ixV65luGQgvQwRe1BSULoPwZXK9Xh4rmStHlnhc6uMv0OUJiXC-GXKGWX6YK_6SrQqTE06C8kcba466wQAB_eZcIZMxFp04h2-sNnzYkKq7eC1aNUrO9z27T57wSC4b1yDh5TE8HtGS2onGVHOCOqUK178-hmZXI3uOgrmczemOrF0zYVK1jEtjGPowVFBWy8DF_rlqBjsVP1-CrDQGz3fIKZWZoDJRDvq1Wnznfg5ZEp8b0h4aZ4tX0jrtgKVBxlzJ94FaPWwDc1Ty0DgElu88SRqdVkYjQcPHfqjkws_L8KnZBcCmmdo-BY5kF4a2qQI3PzpKzsOvq34SlVCh1U4EFdulFq3Y34MgRkSYpPpXgPXGzZ6mn0nvH2LQtHrzZxS52WGEpsmC3omipGMa2r0SB-u21tKf2y_6ytVIZQFiXNFfBaLBeM_P8CI4KCya-wDFWqlaEqsZ828m0BDWI6fIdZmRAKaBbrrlQiADnk4dTkOvguIqu6Mfkp5ZjA2FQoTxe2USEayzk9AuzITQGgPg1SalijYDkf8rEuQ4Lov7KKl1mfziSZL2EaqId5q6Na6rKy5eGsefi_aaPfz5Per8wWedmj04N9tUsiAwAKJXtE3aCbKi9zEDH4Zw-O6HGyxFdbVI0kESPrVCBH_u1kWKo3cu4h63Y-9elpGQqQW-LH3LfVpFSJNPxELQNCDaz_zlzj3WKjs5h1dSrOj-H0OIIR2BbKJ1zoqd-liT2tpFss9r8moaJ4__HkrBZMmt8tz9D4Uu4XjfH4hOTGg8jvdM5bb9ysZ7Pa83crjYft9LjLU1rVDWTV7OjVJ45_LWycKrp8LSMsvzK7qe3WB1wWZghTf1Rj0os9NYqqTYGIKL_D02KRIqayXzq37orBKDpzRNFXUsnj1OXo1yOPv6NrmCN3Oe7jJP5yfuUhlwHXFm0OkbkYphDGvTxNK85Fyc",
            year: 1994,
            country: "США",
            genres: [getGenre(), getGenre()],
            reviews: [getShortReview(), getShortReview(), getShortReview()]
        )
    }

    static func getProfile() -> Profile {
        Profile(
            id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
            nickName: "string",
            email: "user@example.com",
            avatarLink: "https://picsum.photos/200",
            name: "string",
            birthDate: .now,
            gender: .male
        )
    }

    static func getAuthor() -> Author {
        Author(
            userId: UUID().uuidString,
            nickName: "test",
            avatar: nil
        )
    }

    static func getDetailedReview() -> DetailedReview {
        DetailedReview(
            id: UUID().uuidString,
            rating: 5,
            reviewText: "Text",
            isAnonymous: false,
            createDateTime: "2022-10-15T17:10:56.679023",
            author: getAuthor()
        )
    }

    static func getDetailedMovie() -> DetailedMovie {
        DetailedMovie(
            id: UUID().uuidString,
            name: "Форрест Гамп",
            // swiftlint:disable:next line_length
            poster: "https://kinopoisk-ru.clstorage.net/2s89R4K04/ae7af5CslCkK/rVSfH-4xE1g5HfOmBLXTnYX760KasO5cqWbK3B1pm2sMSA_4-9cDU2J9hILb0A-BVRoJJrv1hbU_mgGRzTDtL-xEuu7KtEMt2JlGg3GApywQG9-WLjWKHXhTH2nvmpnoLt8tmwlVAZV2GaBjrmW65VEvrNKLZBHBGLxltulXGEjeZQyN6LKjW4zc8XW0pBFpNYkpdOlDvJgpZVmeXujK-72Nrhm51yNFF5qQRX7HmmajT54ziwJAkeudULbYRykJ3uRdDiqxUWkt3rKUBATiuic4-Tbr4O6LaRbofZ14aIguX5_oexViJqbqAQfuVmglAs7cIvmCIeKrvXPXWHZq6I6kfAxZ8GF5Ta9SNjXlQ5hGKThGiEOfiRmk6M9uOykYjj7Nurj30UbEeGBl_CeqtgM9DuLrMdPDat0AFGrFSzruxM9c6INBae5_Mva0pZL5BzvahHvDrJiJdkl-DWhqeqw-_Urr9CPnxvtDty20e6bQjF5TWyICgJocwMT7R3rYjObPf5uAwenujHAX9gbCuBU5a1SbUy5pKRVKvJ6oC7t8rHzraVYTF0Xbk6cd97qncl_egKnwgkNLHoDFWqZaesy2Dqw4o1C7zpzQt_W18zuHiYrVC9LfqytnKsxe6gkY_s4t6xhnEyfWC-GFr7f7pwGszTPZIlFg2W4Rdyn3aAgcVg4c-cJTm05tQyXUloCrhUlI9unQT1toROsOPQoYuh_MHSirReIWF0jCt4_2iJVjb3yQ6TLAk8hd4MRrVSqoHEYPrnrhM6pvbNLUt4SDCzQ5GYdIc487aXUqzrx5motcPb8qq5eT9vRok2bvh_uVUqxtEymhsoJZvxAUKpSKqk8VvC9IUyBpbU1Q9_TX8Dg0OZinCGGem2inSb4euGrpTL7MKgpFMkbH--ElXOV6FtMv3CIp8pHga-4S5IsU2Jpshtzc63FBif1eE8XWZLFqVEuZJXvznYhJxLreXNvIu34Ovlhbl0Bm91iTl-yEuzfTDU5yGPPAIgndo0fZBMianXUtXoiQ07itztC3ZkTgqvcqOqbIgD0Km-XKrG1ZS2kOj_7ImNXjxseKQwV9pcj2kRx8EQpQY4Fqf3KGytYbO9yknWwas3B7_rwjxJYVU3lGS3pEmhLvCzlnCl1s65lrfB_tGFunMyXEWvOW3pe4VTJtr1EbYtOQq40iNRh0KXr9Bg0cGDDB6a5-szRlhtG6JknpBsrQn7g7xBufvXp6u19dfSgJZ-Ck5hgAZx_2K3dg3j6xeRIjYsnNQsca13iqjoX-zZgTU1u_nXI0BYfTi5Xam6dp0P96ObUKjcwbi6jv7d9KSmRQdzT4E9Qutasm8t_cEDswMELK33MGe-TIuR60Xp1KgZC4XRxA97Wk4ijlWik1CIHMadhUuv6MeYvpT4z9WrpXQhdlGKO1zDeKpKIO3VE7QiACW51gpzrHaMhdhs9sOGOwC12ccMdExfCpJcn5lXtAbkhYtgrsnip62B3e_irbJ8KX1Dpjdl-WSQezXizB6aDjcXldU5QKNykK_DY8fUgS8AhPHJGXtLehulabeQcqgu-ZKUbqzo7r2puef94LO6RDJ3ZJwTQ8tIg3MxzcsPiwImPLjMLFKDV7Ge9nnIzIIQP4Pd9DZXWX8Os3u1iG2oHfCGkFWVwe2nnKLK5fqQnl0kd2KAPW7sWYFfDsThPpkLLDOA7SNxjkKFmsd7zf-1PieS6vcRd3poC4VBq5FUohLZoLVph-X8hKW6xeXai7BgGlVymAdV60qhbgrf_haRHgkhu-ApX5V2rrH5RsH0gxcCptPtA3t8fRajZbCJTrwBy7W8bZDGxJe5r-Po1LOteDFuZoQGZNtTsHwD5OgwtwwjKpPqEnyTaqSZ4FnF3ZUpC4nt0hhpSF0XkVaxoVy-BMmQhEeO9Me9h5vAxsKJmH4Ja2apHUD7U5hVNN32P54eHC2n3Td1q0-PguVD1sqUHjqj6_4xYld_KLhVlq1-vxv4qJJ1jO3_lbW0_Nn3urNyOGp9ixV65luGQgvQwRe1BSULoPwZXK9Xh4rmStHlnhc6uMv0OUJiXC-GXKGWX6YK_6SrQqTE06C8kcba466wQAB_eZcIZMxFp04h2-sNnzYkKq7eC1aNUrO9z27T57wSC4b1yDh5TE8HtGS2onGVHOCOqUK178-hmZXI3uOgrmczemOrF0zYVK1jEtjGPowVFBWy8DF_rlqBjsVP1-CrDQGz3fIKZWZoDJRDvq1Wnznfg5ZEp8b0h4aZ4tX0jrtgKVBxlzJ94FaPWwDc1Ty0DgElu88SRqdVkYjQcPHfqjkws_L8KnZBcCmmdo-BY5kF4a2qQI3PzpKzsOvq34SlVCh1U4EFdulFq3Y34MgRkSYpPpXgPXGzZ6mn0nvH2LQtHrzZxS52WGEpsmC3omipGMa2r0SB-u21tKf2y_6ytVIZQFiXNFfBaLBeM_P8CI4KCya-wDFWqlaEqsZ828m0BDWI6fIdZmRAKaBbrrlQiADnk4dTkOvguIqu6Mfkp5ZjA2FQoTxe2USEayzk9AuzITQGgPg1SalijYDkf8rEuQ4Lov7KKl1mfziSZL2EaqId5q6Na6rKy5eGsefi_aaPfz5Per8wWedmj04N9tUsiAwAKJXtE3aCbKi9zEDH4Zw-O6HGyxFdbVI0kESPrVCBH_u1kWKo3cu4h63Y-9elpGQqQW-LH3LfVpFSJNPxELQNCDaz_zlzj3WKjs5h1dSrOj-H0OIIR2BbKJ1zoqd-liT2tpFss9r8moaJ4__HkrBZMmt8tz9D4Uu4XjfH4hOTGg8jvdM5bb9ysZ7Pa83crjYft9LjLU1rVDWTV7OjVJ45_LWycKrp8LSMsvzK7qe3WB1wWZghTf1Rj0os9NYqqTYGIKL_D02KRIqayXzq37orBKDpzRNFXUsnj1OXo1yOPv6NrmCN3Oe7jJP5yfuUhlwHXFm0OkbkYphDGvTxNK85Fyc",
            year: 1994,
            country: "США",
            genres: [getGenre(), getGenre()],
            reviews: [getDetailedReview()],
            time: 88,
            tagline: "Мир уже никогда не будет прежним, после того как вы увидите его глазами Форреста Гампа",
            // swiftlint:disable:next line_length
            description: "Полувековая история США глазами чудака из Алабамы. Абсолютная классика Роберта Земекиса с Томом Хэнксом",
            director: "Роберт Земекис",
            budget: 55000000,
            fees: 677387716,
            ageLimit: 12
        )
    }

    static func getDisplayingDetailedReview() -> DisplayingDetailedReview {
        DisplayingDetailedReview(
            detailedReview: getDetailedReview(),
            isUserReview: true,
            editClosure: {},
            removeClosure: {}
        )
    }
}
