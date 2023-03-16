create table hibernate_sequence (next_val bigint)
    engine=InnoDB;

insert into hibernate_sequence values ( 2 );

create table message
(
    id bigint not null,
    filename varchar(255),
    tag varchar(255),
    text varchar(2048),
    user_id bigint,
    primary key (id)
);

create table user_role
(
    user_id bigint not null,
    roles varchar(255)
);

create table usr
(
    id bigint not null,
    activation_code varchar(255),
    active bit not null,
    email varchar(255),
    password varchar(255) not null ,
    username varchar(255) not null ,
    primary key (id)
);

alter table message
    add constraint message_user_fk
        foreign key (user_id)
            references usr (id);

alter table user_role add constraint user_role_user_fk
    foreign key (user_id)
        references usr (id);


create table user_subscriptions
(
    channel_id bigint not null references usr,
    subscriber_id bigint not null references usr,
    primary key (channel_id, subscriber_id)
);

insert into usr (id, active, password, username) VALUES (1, true, '$2y$08$bNkuMUg.pJmeBHjQk9E9N.ic5zNDgcvy3UFClDnnxho856NeO2ISW', 'admin');
# имя пользователя - "admin"
# пароль - "admin"

insert into user_role (user_id, roles) VALUES (1, 'USER'), (1, 'ADMIN');