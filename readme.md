rustup update stable
cargo install --git https://github.com/MystenLabs/sui.git sui --branch mainnet
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh
cargo install --locked --git https://github.com/mystenlabs/mvr --branch release mvr
choco install sui
brew install sui
suiup install sui@testnet
suiup install sui
sui client new-address ed25519
sui client switch --address [YOUR_ADDRESS]
 sui client publish --gas-budget 100000000 --verify-deps
https://suiexplorer.com/?network=testnet
sui move new hello_web3
sui move build

