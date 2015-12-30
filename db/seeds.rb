User.delete_all


nameArray=["Dupont","Shakur",'Wallace',"Carter","Parish","Jones","Holmes"];

prenomArray=["Jean","Marguerite",'Roberte',"Joseph","Emile","Genevieve","William"];

photosArticle=["article1.jpg","article2.jpg","article3.jpg","article4.jpg","article5.jpeg"];



for i in 0..6

    nom=nameArray[rand(nameArray.length)];
    prenom=prenomArray[rand(prenomArray.length)];
    mail=nom +"."+ prenom + "@mail.fr";

    User.create([
        first_name:nom,
        last_name:prenom,
        email: mail,
        password: "motdepasse",
        avatar: open("public/default.png"),
    ]);

    nameArray.delete(nom);
    prenomArray.delete(prenom);

end

# User.create([
#     first_name:"Wallace",
# 	last_name:"Christopher",
# 	email: "wallace@hotmail.fr",
# 	password: "motdepasse",
#     avatar: open("public/default.png"),
# 	id: "2"
# ])





Post.delete_all

for j in 0..12
    photoArticle=photosArticle[rand(photosArticle.length)];
    user_id=1+rand(7);

    Post.create([
        title: Forgery(:lorem_ipsum).words(7, :random=> true),
        header: Forgery(:lorem_ipsum).words(25, :random=> true),
        content:Forgery(:lorem_ipsum).words(330, :random=> true),
        user_id: user_id,
        file_name: open("public/"+photoArticle)
    ]);
end

# Post.create([
# 	title: "The Science of Setting and Achieving Goals",
#     header:"When Angela Duckworth was 27, she left her high-pressure management-consulting job for an even tougher gig: teaching seventh-grade math at a New York City public school.",
#     content:"Duckworth quickly learned it wasn’t smarts that determined whether her students accomplished their goals and got good grades—not by a long shot. “I was convinced every one of my students could learn the material if they worked long and hard enough,” she says in her popular TED talk. After a few years of teaching, Duckworth found herself asking the question, “What if doing well in school and in life depends on much more than your ability to learn quickly and easily?” She’s made a career of that question, becoming a psychologist who has studied how and why people set and—most importantly—achieve their goals. A key quality she’s found that separates the winners from the losers? Grit.",
#     user_id: "1",
#     id: "5",
#     file_name: open("public/uploads/post/file_name/5/metal12.jpg")
# ])

# Post.create([
# 	title: "First edition",
#     header:"A behind-the-scenes look at our SPAN 2015 reader.",
#     content:"For this year’s SPAN design conference, we wanted to turn the typical conference giveaway into a thing of substance. So instead of more branded tees or tchotchkes, we decided to produce something that designers might actually want to keep (not just wear for the occasional workout) or put on their shelves (a tall order for picky decorators). But how do you package a conference about ideas and conversations? How do you channel the experience of learning about another person’s passions and process? Then it hit us: We could make a book. You might be wondering, why make a book? Isn’t SPAN about design and technology? Aren’t they UX designers? Don’t they make software, and spend their time thinking about user flows, interactions, and multi-device layouts… Well, we do, but it turns out that much of our thinking about these systems begins with book design. In fact, Material Design is built around the principles of classic typography and grid systems—ideas that started with print design—and, of course, paper. If the proliferation and popularity of book fairs is any indication, it seems like the art of the book is alive and doing well—so we’re definitely not alone in our interest. But beyond precedents and trends, our best reason for making a reader for SPAN, is that it provides a very natural way for us to continue the design conversation. So many of the speakers we invited to the conference have endlessly creative and critical ideas to bring to the design practice, and there’s no way to cover it all in a 40-minute presentation. By creating a reader, we get to capture the essence of this year’s conference, while also being additive. The videos, the connections, and now the book itself collectively offer an experience beyond what an individual attendee could possibly encounter.",
#     user_id: "1",
#     id: "6",
#     file_name: open("public/uploads/post/file_name/6/tile11.jpg")
# ])

# Post.create([
# 	title: "Starbucks paie l’addition",
#     header: "Contre McDonald’s, Starbucks, Costa… ces chaînes multinationales standardisées qui ne paient pas d’impôts et transforment nos villes en espaces mondialisés.",
#     content: "Les attentats du 13 Novembre ont frappé des cafés qui font le charme d’une ville, mais des cafés lambda, non mondialisés, qui ont encore un nom propre : la Belle Equipe (en référence au film de Julien Duvivier, 1936), le Carillon (où la Joconde fut cachée par son voleur en 1911), la Bonne Bière (et son nom désormais empreint d’une ironie tragique). Cafés, on l’a dit et redit, d’un Paris populaire, jeune, nettement différenciés des établissements prestigieux des quartiers touristiques mais aussi des chaînes standardisées qui essaiment partout dans le monde : McDonald’s, Starbucks, et depuis peu Costa. Prenons Starbucks, qui fait pousser des boutiques à la vitesse d’une acné juvénile, et qu’apprécient du reste des jeunes qui ne sont pas les mêmes que ceux qu’on a massacrés. Est-ce qu’Emmanuel Todd va nous expliquer quelle est la sociologie des pratiquants de Starbucks ? Moi, je ne m’appuie pas, contrairement à lui, sur des chiffres ; ce sont des sensations qui me dirigent. Et j’ai remarqué que les gens qui fréquentaient les Starbucks étaient d’une intelligence inférieure à la moyenne.",
#     user_id: "2",
#     id: "7",
#     file_name: open("public/uploads/post/file_name/7/cubetexture.png")
# ])