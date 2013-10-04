alter table menu_menu_item drop foreign key FKEC36C7139394487;
alter table menu_menu_item drop foreign key FKEC36C7137EEA1347;
alter table person_authority drop foreign key FK2C8236D98B03E068;
alter table person_authority drop foreign key FK2C8236D9C70E414C;
alter table sermon drop foreign key FKCA020EAC8AB72368;
drop table if exists authority;
drop table if exists book;
drop table if exists event;
drop table if exists menu;
drop table if exists menu_item;
drop table if exists menu_menu_item;
drop table if exists news_item;
drop table if exists person;
drop table if exists person_authority;
drop table if exists requestmap;
drop table if exists sermon;
drop table if exists speakers;
create table authority (id bigint not null auto_increment, version bigint not null, authority varchar(255) not null unique, primary key (id));
create table book (id bigint not null auto_increment, version bigint not null, chapter_count integer not null, name varchar(255) not null, testament varchar(3) not null, primary key (id));
create table event (id bigint not null auto_increment, version bigint not null, description longtext not null, event_date datetime not null, event_duration varchar(255) not null, event_time varchar(255) not null, imageurl varchar(255) not null, internet_link varchar(255) not null, location varchar(255) not null, title varchar(200) not null, primary key (id));
create table menu (id bigint not null auto_increment, version bigint not null, description varchar(255) not null, name varchar(255) not null, primary key (id));
create table menu_item (id bigint not null auto_increment, version bigint not null, change_date datetime not null, description longtext not null, imageurl varchar(255) not null, item_type varchar(8) not null, itemurl varchar(255) not null, meta_data varchar(255) not null, name varchar(100) not null, order integer not null, primary key (id));
create table menu_menu_item (menu_items_id bigint, menu_item_id bigint);
create table news_item (id bigint not null auto_increment, version bigint not null, description longtext not null, headline varchar(200) not null, internet_link varchar(255) not null, publish_date datetime not null, primary key (id));
create table person (id bigint not null auto_increment, version bigint not null, account_expired bit not null, account_locked bit not null, enabled bit not null, `password` varchar(255) not null, password_expired bit not null, username varchar(255) not null unique, primary key (id));
create table person_authority (authority_id bigint not null, person_id bigint not null, primary key (authority_id, person_id));
create table requestmap (id bigint not null auto_increment, version bigint not null, config_attribute varchar(255) not null, url varchar(255) not null unique, primary key (id));
create table sermon (id bigint not null auto_increment, version bigint not null, audio_file_location varchar(255) not null, book_id bigint, duration varchar(255) not null, end_verse integer not null, image_file_location varchar(255) not null, keywords varchar(250) not null, pub_date datetime not null, service varchar(9) not null, start_verse integer not null, summary longtext not null, title varchar(200) not null, primary key (id));
create table speakers (id bigint not null auto_increment, version bigint not null, name varchar(255) not null, primary key (id));
alter table menu_menu_item add index FKEC36C7139394487 (menu_items_id), add constraint FKEC36C7139394487 foreign key (menu_items_id) references menu (id);
alter table menu_menu_item add index FKEC36C7137EEA1347 (menu_item_id), add constraint FKEC36C7137EEA1347 foreign key (menu_item_id) references menu_item (id);
alter table person_authority add index FK2C8236D98B03E068 (person_id), add constraint FK2C8236D98B03E068 foreign key (person_id) references person (id);
alter table person_authority add index FK2C8236D9C70E414C (authority_id), add constraint FK2C8236D9C70E414C foreign key (authority_id) references authority (id);
alter table sermon add index FKCA020EAC8AB72368 (book_id), add constraint FKCA020EAC8AB72368 foreign key (book_id) references book (id);