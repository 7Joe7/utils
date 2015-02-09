require '../data_mining/data_miner.rb'

DATA = {
    username_id: 'username',
    username: 'renomia1',
    password_id: 'password',
    password: 'Renomia12',
    address: 'https://magnusweb.bisnode.cz/udss/htm/',
}

begin
  data_miner = DataMiner.new(DATA)
ensure
  # data_miner.quit
end
