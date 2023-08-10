create table if not exists tracking_infos
(
    id               int          not null auto_increment
        primary key,
    tracking_number  varchar(100) not null,
    tracking_details text         null,
    constraint tracking_number
        unique (tracking_number)
);
create table if not exists source_name
(
    id int not null AUTO_INCREMENT,
    name varchar(255) not null,
    counter int,
    primary key (id)
);

create table if not exists channel_source
(
    id int not null AUTO_INCREMENT,
    source_id int not null ,
    label varchar(255),
    value varchar(255) not null,
    account_id int not null,
    primary key (id),
    foreign key (source_id) references source_name(id),
    foreign key (account_id) references account(id)
);

insert into source_name (id,name,counter) values (1,'GOOGLE SHEETS',2);
