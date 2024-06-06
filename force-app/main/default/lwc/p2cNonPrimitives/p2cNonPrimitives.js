import { LightningElement } from 'lwc';

export default class P2cNonPrimitives extends LightningElement {
    carousels = [
        {
            src: "https://d2zp5xs5cp8zlg.cloudfront.net/image-73010-800.jpg",
            header: "Austin Vets",
            description: "Originally bred to be lap dogs by the Shang Dynasty, Pugs have taken the responsibility of being companion dogs for over two thousand years. Like Pomeranians, they weren’t always this small, though. After Pugs were imported to the Netherlands from China, the breeder intentionally bred Pugs to make them smaller.",
            alternativeText: "Austin Vets",
            href: "https://www.nwaustinveterinarycenter.com/site/blog/2022/11/30/dog-breeds-that-stay-small-forever"
        },
        {
            src: "https://www.scotsman.com/webimg/b25lY21zOmE1NDBhYTE2LTI4MDUtNDkxYy1hOTgyLWU5YWNmMjQzMWVjNzo0OGIxNWMzMi1iNzhiLTRlOTUtODA3ZS0yYzdiOGM1MzhmYTQ=.jpg?crop=3:2&width=800",
            header: "Devon Rex",
            description: "The Devon Rex has a super cute, small face which can make owners melt. They are highly social cats that don't cope very well when left alone for too long.",
            alternativeText: "Devon Rex",
            href: "https://www.scotsman.com/lifestyle/family-and-parenting/looking-for-a-mini-kitty-here-are-the-top-10-breeds-of-small-cat-that-will-always-look-like-kittens-including-the-gorgeous-burmese-cat-3729607"
        },
        {
            src: "https://cdn.cdnparenting.com/articles/2019/02/07115103/393732661-H-1024x700.webp",
            header: "Betta",
            description: "The betta is not exactly a beginner’s fish due to its aggressive nature (It is also known as the Siamese Fighting Fish). You should know, however, that the betta is aggressive only towards other betta.",
            alternativeText: "Betta",
            href: "https://parenting.firstcry.com/articles/magazine-11-freshwater-fishes-that-will-beautify-your-home-aquarium/"
        }
    ];
}