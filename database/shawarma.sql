/*==============================================================*/
/* Deleting tables if exist                                     */
/*==============================================================*/
drop table if exists Outlet_Shawarma_Price;
drop table if exists Reviews;
drop table if exists Shawarma;
drop table if exists Outlets;

/*==============================================================*/
/* Table: Shawarma                                              */
/*==============================================================*/
drop table if exists Shawarma;
create table Shawarma
(
   ID                   int not null auto_increment,
   Type                 varchar(30) not null,
   Description          varchar(300),
   primary key (ID)
);

/*==============================================================*/
/* Index: UNIQUE_TYPE                                           */
/*==============================================================*/
create unique index UNIQUE_TYPE on Shawarma
(
   Type
);

/*==============================================================*/
/* Table: Outlets                                               */
/*==============================================================*/
create table Outlets
(
   ID                   int not null auto_increment,
   Outlet_name          varchar(100) not null,
   primary key (ID)
);

/*==============================================================*/
/* Table: Outlet_Shawarma_Price                                 */
/*==============================================================*/
create table Outlet_Shawarma_Price
(
   Outlet_ID            int not null,
   Shawarma_ID          int not null,
   Price      			int not null,
   primary key (Outlet_ID, Shawarma_ID),
   constraint FK_OUTLET_S_SHAWARMA__SHAWARMA foreign key (Shawarma_ID)
      references Shawarma (ID) on delete restrict on update restrict,
   constraint FK_OUTLET_S_REFERENCE_OUTLETS foreign key (Outlet_ID)
      references Outlets (ID) on delete restrict on update restrict
);

/*==============================================================*/
/* Index: OUTLET_SHAWARMA_PRICE_UNIQUE                          */
/*==============================================================*/
create unique index OUTLET_SHAWARMA_PRICE_UNIQUE on Outlet_Shawarma_Price
(
   Outlet_ID,
   Shawarma_ID
);

/*==============================================================*/
/* Table: Reviews                                               */
/*==============================================================*/
create table Reviews
(
   ID                   int not null auto_increment,
   Outlet_ID            int not null,
   Review               varchar(500),
   Rating               int not null,
   primary key (ID),
   constraint FK_REVIEWS_REFERENCE_OUTLETS foreign key (Outlet_ID)
      references Outlets (ID) on delete restrict on update restrict
);

/*==============================================================*/
/* Inserting data to tables                                     */
/*==============================================================*/
INSERT INTO `outlets`(`ID`, `Outlet_name`) VALUES (1, 'The best shawarma');
INSERT INTO `outlets`(`ID`, `Outlet_name`) VALUES (2, 'Shawarma is love');
INSERT INTO `outlets`(`ID`, `Outlet_name`) VALUES (3, 'Shawarma 24');
INSERT INTO `outlets`(`ID`, `Outlet_name`) VALUES (4, 'ShawaLama');
INSERT INTO `outlets`(`ID`, `Outlet_name`) VALUES (5, 'Batman and shawarma');
INSERT INTO `outlets`(`ID`, `Outlet_name`) VALUES (6, 'Buy our shawarma');
INSERT INTO `outlets`(`ID`, `Outlet_name`) VALUES (7, 'ShawaDonalds');
INSERT INTO `outlets`(`ID`, `Outlet_name`) VALUES (8, 'SHWRM');
INSERT INTO `outlets`(`ID`, `Outlet_name`) VALUES (9, 'Anime Shawarma');
INSERT INTO `outlets`(`ID`, `Outlet_name`) VALUES (10, 'Mmm... Shawarma');
INSERT INTO `outlets`(`ID`, `Outlet_name`) VALUES (11, 'Good shawarma');
INSERT INTO `outlets`(`ID`, `Outlet_name`) VALUES (12, 'Love is ... shawarma');

INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (1, 1, 'She was too short to see over the fence.', 10);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (2, 1, 'Writing a list of random sentences is harder than I initially thought it would be.', 6);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (3, 1, 'Abstraction is often one floor above you.', 1);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (4, 2, 'I am never at home on Sundays.', 5);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (5, 2, 'Cats are good pets, for they are clean and are not noisy.', 6);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (6, 2, 'Yeah, I think it is a good environment for learning English.', 6);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (7, 3, 'He turned in the research paper on Friday; otherwise, he would have not passed the class.', 7);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (8, 3, 'A song can make or ruin a personвЂ™s day if they let it get to them.', 6);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (9, 3, 'The memory we used to share is no longer coherent.', 10);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (10, 4, 'We have never been to Asia, nor have we visited Africa.', 4);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (11, 4, 'She folded her handkerchief neatly.', 9);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (12, 4, 'The old apple revels in its authority.', 10);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (13, 5, 'Where do random thoughts come from?', 8);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (14, 5, 'I am happy to take your donation; any amount will be greatly appreciated.', 8);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (15, 5, 'He ran out of money, so he had to stop playing poker.', 6);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (16, 6, 'If the Easter Bunny and the Tooth Fairy had babies would they take your teeth and leave chocolate for you?', 5);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (17, 6, 'She advised him to come back at once.', 2);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (18, 6, 'I often see the time 11:11 or 12:34 on clocks.', 10);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (19, 7, 'What was the person thinking when they discovered cowвЂ™s milk was fine for human consumptionвЂ¦ and why did they do it in the first place!?', 6);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (20, 7, 'Two seats were vacant.', 8);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (21, 7, 'Should we start class now, or should we wait for everyone to get here?', 6);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (22, 8, 'Everyone was busy, so I went to the movie alone.', 8);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (23, 8, 'She did not cheat on the test, for it was not the right thing to do.', 2);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (24, 8, 'Malls are great places to shop; I can find everything I need under one roof.', 6);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (25, 9, 'Sometimes it is better to just walk away from things and go back to them later when youвЂ™re in a better frame of mind.', 8);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (26, 9, 'Hurry!', 7);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (27, 9, 'The stranger officiates the meal.', 2);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (28, 10, 'She works two jobs to make ends meet; at least, that was her reason for not having time to join us.', 4);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (29, 10, 'She always speaks to him in a loud voice.', 4);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (30, 10, 'If Purple People Eaters are realвЂ¦ where do they find purple people to eat?', 6);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (31, 11, 'She borrowed the book from him many years ago and has not yet returned it.', 9);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (32, 11, 'Joe made the sugar cookies; Susan decorated them.', 3);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (33, 12, 'He told us a very exciting adventure story.', 4);
INSERT INTO `reviews`(`ID`, `Outlet_ID`, `Review`, `Rating`) VALUES (34, 12, 'The body may perhaps compensates for the loss of a true metaphysics.', 8);

INSERT INTO `shawarma`(`ID`, `Type`, `Description`) VALUES (1, 'Doner kebab', 'Doner kebab is a type of Shawarma');
INSERT INTO `shawarma`(`ID`, `Type`, `Description`) VALUES (2, 'Pita bread with barbecue', 'Pita bread with barbecue is a type of Shawarma');
INSERT INTO `shawarma`(`ID`, `Type`, `Description`) VALUES (3, 'Durum', 'Durum is a type of Shawarma');
INSERT INTO `shawarma`(`ID`, `Type`, `Description`) VALUES (4, 'Gyros', 'Gyros is a type of Shawarma');
INSERT INTO `shawarma`(`ID`, `Type`, `Description`) VALUES (5, 'Brtus', 'Brtus is a type of Shawarma');
INSERT INTO `shawarma`(`ID`, `Type`, `Description`) VALUES (6, 'Burrito', 'Burrito is a type of Shawarma');
INSERT INTO `shawarma`(`ID`, `Type`, `Description`) VALUES (7, 'Enchilada', 'Enchilada is a type of Shawarma');
INSERT INTO `shawarma`(`ID`, `Type`, `Description`) VALUES (8, 'Taco', 'Taco is a type of Shawarma');
INSERT INTO `shawarma`(`ID`, `Type`, `Description`) VALUES (9, 'Tantuni', 'Tantuni is a type of Shawarma');
INSERT INTO `shawarma`(`ID`, `Type`, `Description`) VALUES (10, 'Quesadilla', 'Quesadilla is a type of Shawarma');
INSERT INTO `shawarma`(`ID`, `Type`, `Description`) VALUES (11, 'Fajitas', 'Fajitas is a type of Shawarma');

INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (1, 1, 920);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (1, 2, 1098);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (1, 3, 1871);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (1, 4, 1685);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (1, 5, 696);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (1, 6, 364);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (1, 7, 470);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (1, 8, 486);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (1, 9, 857);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (1, 10, 372);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (1, 11, 1603);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (2, 1, 967);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (2, 2, 671);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (2, 3, 871);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (2, 4, 1807);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (2, 5, 1684);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (2, 6, 452);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (2, 7, 544);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (2, 8, 1658);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (2, 9, 1895);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (2, 10, 1839);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (2, 11, 466);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (3, 1, 1334);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (3, 2, 623);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (3, 3, 1340);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (3, 4, 1626);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (3, 5, 1404);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (3, 6, 383);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (3, 7, 1848);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (3, 8, 815);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (3, 9, 225);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (3, 10, 1544);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (3, 11, 234);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (4, 1, 247);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (4, 2, 778);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (4, 3, 1241);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (4, 4, 886);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (4, 5, 1025);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (4, 6, 1872);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (4, 7, 764);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (4, 8, 1165);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (4, 9, 968);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (4, 10, 463);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (4, 11, 1834);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (5, 1, 1921);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (5, 2, 1794);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (5, 3, 903);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (5, 4, 881);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (5, 5, 1298);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (5, 6, 664);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (5, 7, 1642);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (5, 8, 474);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (5, 9, 1353);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (5, 10, 1222);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (5, 11, 1685);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (6, 1, 1657);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (6, 2, 1556);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (6, 3, 1680);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (6, 4, 1935);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (6, 5, 282);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (6, 6, 288);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (6, 7, 137);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (6, 8, 168);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (6, 9, 844);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (6, 10, 1340);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (6, 11, 1932);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (7, 1, 1490);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (7, 2, 1206);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (7, 3, 895);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (7, 4, 999);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (7, 5, 1637);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (7, 6, 724);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (7, 7, 1234);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (7, 8, 201);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (7, 9, 1798);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (7, 10, 436);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (7, 11, 1461);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (8, 1, 1654);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (8, 2, 1489);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (8, 3, 125);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (8, 4, 1083);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (8, 5, 201);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (8, 6, 656);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (8, 7, 915);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (8, 8, 1161);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (8, 9, 751);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (8, 10, 531);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (8, 11, 505);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (9, 1, 1806);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (9, 2, 1504);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (9, 3, 46);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (9, 4, 332);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (9, 5, 1409);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (9, 6, 1064);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (9, 7, 114);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (9, 8, 1481);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (9, 9, 941);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (9, 10, 821);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (9, 11, 446);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (10, 1, 1843);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (10, 2, 1890);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (10, 3, 1441);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (10, 4, 308);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (10, 5, 1656);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (10, 6, 857);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (10, 7, 1539);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (10, 8, 448);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (10, 9, 1859);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (10, 10, 1406);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (10, 11, 1819);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (11, 1, 538);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (11, 2, 350);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (11, 3, 408);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (11, 4, 879);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (11, 5, 937);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (11, 6, 1492);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (11, 7, 545);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (11, 8, 40);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (11, 9, 1306);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (11, 10, 1686);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (11, 11, 1704);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (12, 1, 1017);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (12, 2, 1279);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (12, 3, 1451);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (12, 4, 1908);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (12, 5, 738);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (12, 6, 380);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (12, 7, 546);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (12, 8, 1966);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (12, 9, 771);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (12, 10, 31);
INSERT INTO `outlet_shawarma_price`(`Outlet_ID`, `Shawarma_ID`, `Price`) VALUES (12, 11, 934);






