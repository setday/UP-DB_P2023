from sqlalchemy import create_engine, Column, Integer, String, text
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import declarative_base
from sqlalchemy import MetaData

login = 'postgres'
password = 'admin'
engine = create_engine(f'postgresql://{login}:{password}@localhost/postgres')
with engine.connect() as connection:
    connection.execute(text('SET search_path TO db_project'))
Session = sessionmaker(bind=engine)

Base = declarative_base()


class Player(Base):
    __tablename__ = 'player'
    __table_args__ = {'schema': 'db_project'}

    player_id = Column(Integer, primary_key=True)
    nickname = Column(String)
    first_name = Column(String)
    last_name = Column(String)
    address = Column(String)


# create a new session
session = Session()

# insert a new player
new_player = Player(nickname='Skripkon', first_name='Николай', last_name='Скрипко',
                    address='пр. Ленина, 23, г. Санкт-Петербург, Россия')
session.add(new_player)
session.commit()

# update a player
player_to_update = session.query(Player).filter(Player.first_name == 'Александр', Player.last_name == 'Серков').first()
player_to_update.nickname = 'SetMidnight'
session.commit()

# delete a player
player_to_delete = session.query(Player).filter(Player.nickname == 'RedHat').first()
session.delete(player_to_delete)
session.commit()

# select players
players = session.query(Player).filter(Player.nickname.like('S%')).all()
for player in players:
    print(player.nickname, player.first_name, player.last_name, player.address)
