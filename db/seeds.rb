users = User.create([
  {username: 'cap', email: 'captain_america@starkindustries.com', password: 'america'},
  {username: 'thor', email: 'thor@starkindustries.com', password: 'thunder'}
])


authors = Author.create([
    {name: 'Stan Lee'}, {name: 'Larry Lieber'}, {name: 'Robert Bernstein'}
])


illustrators = Illustrator.create([
    {name: 'Don Heck'}, {name: 'Jack Kirby'}, {name: 'Steve Ditko'}, {name: 'Gene Colan'}, {name: 'Larry Lieber'}
])

comics = Comic.create([ 
    {title: 'Tales of Suspense #39', date: 'March 01, 1963', volume: '39', user_ids: [users[0].id, users[1].id], author_ids: [authors[0].id, authors[1].id], illustrator_ids: [illustrators[0].id, illustrators[2].id, illustrators[3].id]},
    {title: 'Tales of Suspense #40', date: 'April 01, 1963', volume: '40', user_ids:[users[0].id, users[1].id], author_ids: [authors[0].id, authors[1].id, authors[2].id], illustrator_ids: [illustrators[1].id, illustrators[2].id, illustrators[4].id]} 
])