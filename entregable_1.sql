--==================TABLA DE USUARIOS=======================================================================
create table users (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(100)
);
--====================USUARIOS===============================================================================
insert into users (first_name, last_name, email) values
('Yeiner', 'Aguirre', 'yeiner@gmail.com'),
('Dahiana', 'Herrera', 'herrera@gmail.com'),
('juan','Quirama', 'juanQ@gmail.com')

select * from users

--===================================TABLA DE POST===============================================
create table posts (
	id serial primary key,
	title varchar(100),
	text text,
	creator_id int references users(id)
);
--===========================AÑADIMOS POST =================================================================================================
insert into posts (title,text,creator_id) values
('REALIDAD VIRTUAL INMERSIVA', 'Sumérgete en mundos virtuales con gráficos impresionantes y experiencias interactivas que desafían los límites de la imaginación.',2 ),
('INTELIGENCIA ARTIFICIAL DOMÉSTICA','Haz que tu hogar sea más inteligente con dispositivos que aprenden de tus hábitos y automatizan tareas cotidianas para hacer tu vida más fácil y eficiente.', 1),
('TRANSPORTE AUTÓNOMO','Prepárate para un futuro donde los vehículos se conducen solos, prometiendo viajes más seguros, sin estrés y con menos congestión en las carreteras.', 2),
('IMPLANTES NEURALES','La fusión entre el cerebro y la tecnología está transformando la medicina y la interacción hombre-máquina, abriendo nuevas posibilidades en rehabilitación, comunicación y mejoramiento cognitivo.', 3),
('ENERGÍA RENOVABLE INNOVADORA', 'Avances en energía solar, eólica y almacenamiento están allanando el camino hacia un futuro más limpio y sostenible, reduciendo nuestra dependencia de los combustibles fósiles y mitigando el cambio climático.', 1);

--========================TRAEMOS POST CON INFORMACION DEL CREATOR_ID================================================================
select * from users inner join posts
on users.id = posts.creator_id;

--======================CREAMOS TABLA PIVOTE LIKES=================================
create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

--=====================ASIGNAMOS ME GUSTA A LOS POST=============================
insert into likes (user_id,post_id) values
(1,4),
(3,5),
(1,2),
(2,3),
(2,1);

select * from likes;

---=============================TRAEMOS LOS USUARIOS QUE LE GUSTARON ALGUNO DE LOS POST================================
select users.first_name AS 👍, users.last_name, posts.title, posts.text from users inner join likes
on users.id = likes.user_id inner join posts
on likes.post_id = posts.id
